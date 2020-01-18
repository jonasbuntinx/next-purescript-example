module Next.Server where

import Prelude
import Control.Monad.Except (runExcept)
import Control.Promise (Promise, fromAff)
import Data.Either (hush)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype, wrap)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn1, runEffectFn2)
import Foreign (Foreign)
import Foreign.Generic (class Decode, decode)
import React.Basic.Hooks as React

newtype Context
  = Context
  { err :: Foreign
  , req :: Foreign
  , res :: Foreign
  , pathname :: String
  , query :: Foreign
  , asPath :: Foreign
  }

derive instance newtypeContext :: Newtype Context _

instance decodeContext :: Decode Context where
  decode = decode >>> map wrap

attachGetInitialProps ::
  forall props.
  (Maybe Context -> Aff { | props }) ->
  React.ReactComponent { | props } ->
  Effect (React.ReactComponent { | props })
attachGetInitialProps getInitialProps =
  runEffectFn2
    unsafeSetGetInitialProps
    ( mkEffectFn1
        ( fromAff
            <<< getInitialProps
            <<< hush
            <<< runExcept
            <<< decode
        )
    )

foreign import unsafeSetGetInitialProps ::
  forall props.
  EffectFn2 (EffectFn1 Foreign (Promise props)) (React.ReactComponent props) (React.ReactComponent props)
