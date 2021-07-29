module Pages.Document where

import Prelude
import Effect (Effect)
import Next.Document as N
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkDocument :: Effect (React.ReactComponent {})
mkDocument = do
  N.unsafeDocument =<< React.reactComponent "Document" \_ -> pure render
  where
  render =
    N.html
      { children:
          [ N.head { children: [ R.title_ [ R.text "Next.js with Purescript Example" ] ] }
          , R.body
              { className: "font-sans antialiased leading-normal tracking-wider bg-gray-200"
              , children:
                  [ N.main {}
                  , N.nextScript {}
                  ]
              }
          ]
      }
