module Next.Router where

import Prelude
import Effect (Effect)
import Effect.Uncurried (mkEffectFn1)

foreign import _on :: forall a. String -> a -> Effect Unit

foreign import _off :: forall a. String -> a -> Effect Unit

event :: forall a. String -> a -> Effect (Effect Unit)
event name cb = _on name cb $> _off name cb

onRouteChangeStart :: (String -> Effect Unit) -> Effect (Effect Unit)
onRouteChangeStart = event "routeChangeStart" <<< mkEffectFn1

routeChangeComplete :: (String -> Effect Unit) -> Effect (Effect Unit)
routeChangeComplete = event "routeChangeComplete" <<< mkEffectFn1

routeChangeError :: forall r. ({ cancelled :: Boolean | r } -> Effect Unit) -> Effect (Effect Unit)
routeChangeError = event "routeChangeError" <<< mkEffectFn1
