module Pages.App (Props, mkApp) where

import Prelude
import Components.App as App
import Context.Settings (mkSettingsProvider)
import Control.Monad.Reader (runReaderT)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import React.Basic.Hooks as React

type Props props
  = { "Component" :: App.Component props
    , pageProps :: props
    }

mkApp :: forall props. Props props -> Effect React.JSX
mkApp props = do
  context /\ settingsProvider <- mkSettingsProvider
  component <- runReaderT props."Component" { settings: context }
  pure $ settingsProvider $ component props.pageProps
