module Page.Home (mkHome, getServerSideProps) where

import Prelude
import Component.Navigation (mkNavigation)
import Config as Config
import Control.Promise (Promise, fromAff)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Console as Console
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Milkis as M
import Milkis.Impl.Node (nodeFetch)
import React.Basic.DOM as R
import React.Basic.Hooks as React

type Props
  = { header :: String }

mkHome :: React.Component Props
mkHome = do
  navigation <- mkNavigation
  React.component "Home" \props -> React.do
    pure $ render { navigation } props
  where
  render slots props =
    React.fragment
      [ slots.navigation unit
      , R.div
          { className: "max-w-5xl flex mx-auto my-12"
          , children:
              [ R.div
                  { className: "mr-1 text-gray-100 w-3/5 shadow-2xl bg-gray-800 p-12 text-left"
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
  res <- M.text =<< M.fetch nodeFetch (M.URL $ Config.apiEndpoint <> "/posts/1") M.defaultFetchOptions
  liftEffect $ Console.log res
  pure $ { header: "Home" }

getServerSideProps :: forall ctx. EffectFn1 ctx (Promise { props :: Props })
getServerSideProps =
  mkEffectFn1 $ fromAff
    <<< map { props: _ }
    <<< fetchData
