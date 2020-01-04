module Next.Data where

import Prelude
import Control.Monad.Except (runExcept)
import Control.Promise (Promise, fromAff)
import Data.Bifunctor (lmap)
import Data.Either (Either)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype, wrap)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn1, runEffectFn2)
import Foreign (Foreign)
import Foreign.Generic (class Decode, decode)
import Foreign.Object (Object)
import React.Basic.Hooks as React

newtype Context
  = Context
  { err :: Maybe Foreign
  , req :: Maybe Foreign
  , res :: Maybe Foreign
  , pathname :: Maybe String
  , query :: Maybe (Object String)
  , asPath :: Maybe String
  }

derive instance newtypeContext :: Newtype Context _

instance decodeContext :: Decode Context where
  decode = decode >>> map wrap

attachGetInitialProps :: forall props. (Either String Context -> Aff { | props }) -> React.ReactComponent { | props } -> Effect (React.ReactComponent { | props })
attachGetInitialProps getInitialProps =
  runEffectFn2
    unsafeSetGetInitialProps
    (mkEffectFn1 $ fromAff <<< getInitialProps <<< lmap show <<< runExcept <<< decode)

foreign import unsafeSetGetInitialProps ::
  forall props.
  EffectFn2 (EffectFn1 Foreign (Promise props)) (React.ReactComponent props) (React.ReactComponent props)
