module Next.Hooks (component) where

import Prelude
import Control.Monad.Except (runExcept)
import Control.Promise (Promise, fromAff)
import Data.Bifunctor (lmap)
import Data.Either (Either)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn1, runEffectFn2)
import Foreign (Foreign)
import Foreign.Generic (decode)
import Next.Data (Context)
import Prim.Row (class Lacks)
import React.Basic.Hooks (Render)
import React.Basic.Hooks as React
import Unsafe.Coerce (unsafeCoerce)

component ::
  forall hooks props.
  Lacks "children" props =>
  Lacks "key" props =>
  Lacks "ref" props =>
  String ->
  (Either String Context -> Aff { | props }) ->
  ({ | props } -> Render Unit hooks React.JSX) ->
  Effect (React.ReactComponent { | props })
component = unsafeComponent

unsafeComponent ::
  forall hooks props.
  Lacks "key" props =>
  Lacks "ref" props =>
  String ->
  (Either String Context -> Aff { | props }) ->
  ({ | props } -> Render Unit hooks React.JSX) ->
  Effect (React.ReactComponent { | props })
unsafeComponent name getInitialProps renderFn =
  let
    c =
      unsafeReactFunctionComponent
        ( mkEffectFn1
            ( \props ->
                unsafeDiscardRenderEffects (renderFn props)
            )
        )
  in
    runEffectFn2 unsafeSetDisplayName name c
      >>= runEffectFn2 unsafeSetGetInitialProps
          (mkEffectFn1 $ fromAff <<< getInitialProps <<< lmap show <<< runExcept <<< decode)

unsafeDiscardRenderEffects :: forall x y a. Render x y a -> Effect a
unsafeDiscardRenderEffects = unsafeCoerce

unsafeReactFunctionComponent :: forall props. EffectFn1 props React.JSX -> React.ReactComponent props
unsafeReactFunctionComponent = unsafeCoerce

foreign import unsafeSetDisplayName ::
  forall props.
  EffectFn2 String (React.ReactComponent props) (React.ReactComponent props)

foreign import unsafeSetGetInitialProps ::
  forall props.
  EffectFn2 (EffectFn1 Foreign (Promise props)) (React.ReactComponent props) (React.ReactComponent props)
