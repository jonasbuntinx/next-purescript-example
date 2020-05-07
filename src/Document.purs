module Document (mkDocument) where

import Prelude
import Effect (Effect)
import Effect.Uncurried (runEffectFn1)
import Next.Document (html, head, main, nextScript) as N
import Next.Server (unsafeDocument) as N
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkDocument :: Effect (React.ReactComponent {})
mkDocument = do
  c <-
    React.reactComponent "Document" \_ -> React.do
      pure render
  runEffectFn1 N.unsafeDocument c
  where
  render =
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
