module Website.App (Props, mkApp) where

import Prelude
import Control.Monad.Reader (runReaderT)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import React.Basic.Hooks as React
import Website.Component.Website as Website
import Website.Context.Settings (mkSettingsProvider)

type Props props
  = { "Component" :: Website.Component props
    , pageProps :: props
    }

mkApp :: forall props. Props props -> Effect React.JSX
mkApp props = do
  context /\ settingsProvider <- mkSettingsProvider
  component <- runReaderT props."Component" { settings: context }
  pure $ settingsProvider $ component props.pageProps
