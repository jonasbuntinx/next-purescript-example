module Document where

import Prelude
import Control.Promise (fromAff)
import Data.Nullable (null)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Uncurried (mkEffectFn1)
import Next.Document as N
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkDocument :: Effect N.Document
mkDocument = do
  N.unsafeDocument getInitialProps =<< React.reactComponent "Document" \_ -> pure render
  where
  render =
    N.html
      { children:
          [ N.head
              { children:
                  [ R.title
                      { children: [ R.text "Next.js with Purescript Example" ]
                      }
                  ]
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

getInitialProps :: forall r. N.RenderPage r
getInitialProps = mkEffectFn1 (fromAff <<< transform)
  where
  transform :: N.DocumentContext r -> Aff N.RenderPageResult
  transform { renderPage } = do
    pure
      $ renderPage
          { enhanceApp: null
          , enhanceComponent: null
          }
