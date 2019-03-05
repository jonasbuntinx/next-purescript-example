module Next.Utils where

import Prelude

import Control.Monad.Except (runExcept)
import Control.Promise (Promise, fromAff)
import Data.Bifunctor (lmap)
import Data.Either (Either)
import Next.Data (Context)
import Effect.Aff (Aff)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Foreign (Foreign)
import Foreign.Class (decode)
import React.Basic (JSX)

foreign import withInitialPropsImpl
  :: forall props
  . EffectFn1 Foreign (Promise { | props })
  -> ({ | props } -> JSX)
  -> ({ | props } -> JSX)

withInitialProps 
  :: forall props
  . (Either String Context -> Aff { | props }) 
  -> ({ | props } -> JSX)
  -> ({ | props } -> JSX)
withInitialProps f = withInitialPropsImpl
  $ mkEffectFn1 $ fromAff <<< f <<< lmap show <<< runExcept <<< decode
