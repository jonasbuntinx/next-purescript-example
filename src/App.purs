module App (mkApp) where

import Prelude
import Component.App as App
import Context.Settings (mkSettingsProvider)
import Control.Monad.Reader (runReaderT)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import React.Basic.Hooks as React

type AppProps props
  = { "Component" :: App.Component props
    , pageProps :: props
    }

mkApp :: forall props. AppProps props -> Effect React.JSX
mkApp props = do
  context /\ settingsProvider <- mkSettingsProvider
  component <- runReaderT props."Component" { settings: context }
  pure $ settingsProvider $ component props.pageProps
