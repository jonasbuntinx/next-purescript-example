module App (mkApp) where

import Prelude
import Effect (Effect)
import Next.Head (head) as N
import React.Basic.DOM as R
import React.Basic.Hooks as React

type Props r
  = { "Component" :: React.ReactComponent { | r }
    , pageProps :: { | r }
    }

mkApp :: forall r. Effect (React.ReactComponent (Props r))
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
