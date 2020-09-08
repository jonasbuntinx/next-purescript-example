module Document where

import Prelude
import Control.Promise (fromAff)
import Data.Nullable (null)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Uncurried (mkEffectFn1)
import Next.Document (html, head, main, nextScript) as N
import Next.Server (Document, DocumentContext, RenderPageResult, RenderPage)
import Next.Server (unsafeDocument) as N
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkDocument :: Effect Document
mkDocument = do
  N.unsafeDocument getInitialProps =<< React.reactComponent "Document" \_ -> pure render
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

getInitialProps :: forall r. RenderPage r
getInitialProps = mkEffectFn1 (fromAff <<< transform)
  where
  transform :: DocumentContext r -> Aff RenderPageResult
  transform { renderPage } = do
    pure
      $ renderPage
          { enhanceApp: null
          , enhanceComponent: null
          }
