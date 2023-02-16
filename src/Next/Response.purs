module Next.Response (sendString) where

import Prelude
import Effect (Effect)
import Effect.Uncurried (runEffectFn2, EffectFn2)
import Node.HTTP (Response)

foreign import _sendString :: EffectFn2 Response String Unit

sendString :: Response -> String -> Effect Unit
sendString = runEffectFn2 _sendString
