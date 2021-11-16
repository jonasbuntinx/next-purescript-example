module Components.Page where

import Prelude
import Control.Monad.Reader (ReaderT, ask)
import Effect (Effect)
import Effect.Class (liftEffect)
import Env (Env)
import React.Basic.Hooks as React

type Component props =
  ReaderT Env Effect (props -> React.JSX)

component ::
  forall props hooks.
  String ->
  (Env -> props -> React.Render Unit hooks React.JSX) ->
  Component props
component name renderFn = do
  env <- ask
  liftEffect
    $ React.component name \props -> React.do
        renderFn env props
