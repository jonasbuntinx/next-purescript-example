module Pages.Home (mkHome) where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Console as Console
import Next.Link (link) as N
import Next.Server (Context(..), attachGetInitialProps)
import React.Basic.DOM as R
import React.Basic.Hooks as React

type Props
  = { header :: String }

mkHome :: Effect (React.ReactComponent Props)
mkHome =
  attachGetInitialProps getInitialProps
    =<< React.component "Home" \props -> React.do
        pure $ render props
  where
  render props =
    R.div_
      [ R.h1_ [ R.text props.header ]
      , R.p_ [ R.text "Welcome to my Next.js with Purescript Example!" ]
      , R.br {}
      , R.ul_
          [ R.li_
              [ N.link
                  { href: "/home"
                  , children:
                    R.a { children: [ R.text "> home" ] }
                  }
              ]
          , R.li_
              [ N.link
                  { href: "/about"
                  , children:
                    R.a { children: [ R.text "> about" ] }
                  }
              ]
          , R.li_
              [ N.link
                  { href: "/profile"
                  , children:
                    R.a { children: [ R.text "> profile" ] }
                  }
              ]
          ]
      ]

  getInitialProps ctx = do
    liftEffect
      $ case ctx of
          Nothing -> Console.log "Something went wrong"
          Just (Context { pathname }) -> Console.log pathname
    pure $ { header: "Home" }
