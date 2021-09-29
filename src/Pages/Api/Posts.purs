module Pages.Api.Posts (fetchData) where

import Prelude
import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Config (apiEndpoint)
import Control.Promise (Promise, fromAff)
import Data.Either (Either(..), either)
import Data.HTTP.Method (Method(..))
import Effect.Aff (Aff)
import Effect.Aff.Compat (mkEffectFn2)
import Effect.Class (liftEffect)
import Effect.Console as Console
import Effect.Uncurried (EffectFn2)
import Next.Response (sendString)
import Node.HTTP (Request, Response, setStatusCode)

--fetchData :: forall ctx. ctx -> Aff Props
_fetchData :: Request -> Response -> Aff Unit -- (Either Error String)
_fetchData _req resp = do
  res <- AX.request (AX.defaultRequest { url = apiEndpoint <> "/posts/1", method = Left GET, responseFormat = ResponseFormat.string })
  liftEffect
    $ do
        Console.log $ either AX.printError _.body res
        case res of
          Left e -> do
            setStatusCode resp 500
            sendString resp (AX.printError e)
          Right r -> do
            setStatusCode resp 200
            sendString resp (r.body)

--pure ((arg <> _) <<< _.body <$> res)
fetchData :: EffectFn2 Request Response (Promise Unit)
fetchData = mkEffectFn2 f
  where
  f req resp = fromAff $ _fetchData req resp

-- _sayHi :: String -> Aff String
-- _sayHi name = do
--   delay $ Milliseconds 100.0
--   pure $ "hello " <> name
-- sayHiDelayed :: String -> Effect (Promise String)
-- sayHiDelayed name = fromAff $ _sayHi name
-- sayHiNow :: EffectFn1 String (Promise String)
-- sayHiNow = mkEffectFn1 sayHiDelayed
