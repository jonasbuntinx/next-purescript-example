module App (mkApp) where

import Prelude
import Next.Head (head) as N
import Next.Server (AppProps)
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkApp :: forall props. React.Component (AppProps props)
mkApp = do
  React.component "App" \props -> React.do
    pure $ render props
  where
  render props =
    React.fragment
      [ N.head
          { children:
              [ R.title
                  { children: [ R.text "Next.js with Purescript Example" ]
                  }
              ]
          }
      , React.element props."Component" props.pageProps
      ]
