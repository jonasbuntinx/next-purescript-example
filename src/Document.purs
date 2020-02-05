module Document (mkDocument) where

import Prelude
import Effect (Effect)
import Next.Document (html, head, main, nextScript) as N
import Next.Server (asDocument)
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkDocument :: Effect (React.ReactComponent {})
mkDocument = do
  asDocument
    =<< React.component "Document" \props -> React.do
        pure $ render props
  where
  render props =
    N.html
      { children:
        [ N.head
            { children:
              []
            }
        , R.body
            { className: "font-sans antialiased leading-normal tracking-wider bg-gray-200"
            , children:
              [ N.main {}
              , N.nextScript {}
              ]
            }
        ]
      }
