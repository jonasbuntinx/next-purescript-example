module Pages.Home (mkHome, getServerSideProps) where

import Prelude
import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Components.Page as Page
import Config as Config
import Control.Promise (Promise, fromAff)
import Data.Either (Either(..), either)
import Data.HTTP.Method (Method(..))
import Data.Maybe (fromMaybe)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Console as Console
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import React.Basic.DOM as R
import React.Basic.Hooks as React

type Props =
  { header :: String
  }

mkHome :: Page.Component Props
mkHome = do
  Page.component "Home" \env props -> React.do
    settings <- React.useContext env.settings
    React.useEffect settings do
      Console.log $ fromMaybe "No settings" settings
      mempty
    pure $ render props
  where
  render props =
    React.fragment
      [ R.div
          { className: "max-w-5xl flex mx-auto my-12"
          , children:
              [ R.div
                  { className: "mr-1 text-slate-100 w-3/5 shadow-2xl bg-slate-800 p-12 text-left"
                  , children:
                      [ R.h1
                          { className: "text-3xl font-bold"
                          , children:
                              [ R.text props.header
                              ]
                          }
                      , R.div
                          { className: "w-4/5 pt-3 border-b-2 border-teal-500"
                          }
                      , R.p
                          { className: "pt-4 text-sm"
                          , children:
                              [ R.text "Welcome to my Next.js with Purescript Example!"
                              ]
                          }
                      ]
                  }
              , R.div
                  { className: "w-2/5"
                  , children:
                      [ R.img
                          { className: "shadow-2xl"
                          , src: "https://source.unsplash.com/IuLgi9PWETU"
                          }
                      ]
                  }
              ]
          }
      ]

fetchData :: forall ctx. ctx -> Aff Props
fetchData _ = do
  res <- AX.request (AX.defaultRequest { url = Config.apiEndpoint <> "/posts/1", method = Left GET, responseFormat = ResponseFormat.string })
  liftEffect $ Console.log $ either AX.printError _.body res
  pure { header: "Home" }

getServerSideProps :: forall ctx. EffectFn1 ctx (Promise { props :: Props })
getServerSideProps =
  mkEffectFn1 $ fromAff
    <<< map { props: _ }
    <<< fetchData
