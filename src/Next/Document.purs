module Next.Document where

import Control.Promise (Promise)
import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn2)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)
import React.Basic as React

-- | Components
type Props_html
  = ( children :: Array JSX
    )

html ::
  forall attrs attrs_.
  Union attrs attrs_ Props_html =>
  Record attrs ->
  JSX
html attrs = element _html attrs

foreign import _html :: forall attrs. ReactComponent attrs

type Props_head
  = ( children :: Array JSX
    , nonce :: String
    , crossOrigin :: String
    )

head ::
  forall attrs attrs_.
  Union attrs attrs_ Props_head =>
  Record attrs ->
  JSX
head attrs = element _head attrs

foreign import _head :: forall attrs. ReactComponent attrs

type Props_main
  = ( children :: Array JSX
    )

main ::
  forall attrs attrs_.
  Union attrs attrs_ Props_main =>
  Record attrs ->
  JSX
main attrs = element _main attrs

foreign import _main :: forall attrs. ReactComponent attrs

type Props_nextScript
  = ( children :: Array JSX
    , nonce :: String
    , crossOrigin :: String
    )

nextScript ::
  forall attrs attrs_.
  Union attrs attrs_ Props_nextScript =>
  Record attrs ->
  JSX
nextScript attrs = element _nextScript attrs

foreign import _nextScript :: forall attrs. ReactComponent attrs

-- | Document
type DocumentComponent
  = React.ReactComponent DocumentProps

type DocumentProps
  = { isDevelopment :: Boolean
    }

type Enhancer props
  = Nullable ((props -> React.JSX) -> (props -> React.JSX))

type DocumentContext r
  = { renderPage ::
        { enhanceApp :: forall props. Enhancer props
        , enhanceComponent :: forall props. Enhancer props
        } ->
        RenderPageResult
    | r
    }

type RenderPageResult
  = { html :: String, head :: Array React.JSX }

type RenderPage r
  = EffectFn1 (DocumentContext r) (Promise RenderPageResult)

unsafeDocument ::
  forall r.
  RenderPage r ->
  DocumentComponent ->
  Effect Document
unsafeDocument = runEffectFn2 _unsafeDocument

foreign import data Document :: Type

foreign import _unsafeDocument :: forall r. EffectFn2 (RenderPage r) DocumentComponent Document
