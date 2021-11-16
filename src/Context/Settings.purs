module Context.Settings where

import Prelude
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested (type (/\), (/\))
import Effect (Effect)
import React.Basic.Hooks as React

type Context =
  React.ReactContext (Maybe String)

mkSettingsProvider :: Effect (Context /\ (React.JSX -> React.JSX))
mkSettingsProvider = do
  context <- React.createContext Nothing
  component <-
    React.component "SettingsProvider" \content -> React.do
      pure $ React.provider context (Just "Hello from Settings") $ pure content
  pure (context /\ component)
