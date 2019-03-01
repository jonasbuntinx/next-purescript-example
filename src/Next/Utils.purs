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
import React.Basic (ReactComponent)

foreign import withGetInitialPropsImpl
  :: forall props
  . EffectFn1 Foreign (Promise { | props })
  -> ReactComponent { | props } 
  -> ReactComponent { | props } 

withGetInitialProps 
  :: forall props
  . (Either String Context -> Aff { | props }) 
  -> ReactComponent { | props } 
  -> ReactComponent { | props }
withGetInitialProps f = withGetInitialPropsImpl
  $ mkEffectFn1 $ fromAff <<< f <<< lmap show <<< runExcept <<< decode
