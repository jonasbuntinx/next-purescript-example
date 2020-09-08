module Next.Server where

import Control.Promise (Promise)
import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn2)
import React.Basic.Hooks as React

-- | App
type AppProps props
  = { "Component" :: React.ReactComponent { | props }
    , pageProps :: { | props }
    }

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
        { enhanceApp :: forall props. Enhancer (AppProps props)
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
