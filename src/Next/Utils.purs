module Next.Utils where

import Prelude

import Control.Monad.Except (runExcept)
import Control.Promise (Promise, fromAff)
import Data.Bifunctor (lmap)
import Data.Either (Either)
import Data.Next (Context)
import Effect.Aff (Aff)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Foreign (Foreign)
import Foreign.Class (decode)
import React.Basic (JSX)

foreign import withGetInitialPropsImpl
  :: forall props
  . EffectFn1 Foreign (Promise { | props })
  -> ( { | props } -> JSX)
  -> ( { | props } -> JSX)

withGetInitialProps 
  :: forall props
  . (Either String Context -> Aff { | props }) 
  -> ( { | props } -> JSX)
  -> ( { | props } -> JSX)
withGetInitialProps f = withGetInitialPropsImpl
  $ mkEffectFn1 $ fromAff <<< f <<< lmap show <<< runExcept <<< decode
