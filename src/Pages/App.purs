module Pages.App (Props, mkApp) where

import Prelude
import Components.App as App
import Context.Settings (mkSettingsProvider)
import Control.Monad.Reader (runReaderT)
import Data.Tuple.Nested ((/\))
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import React.Basic.Hooks as React

type Props props
  = { "Component" :: App.Component props
    , pageProps :: props
    }

mkApp :: forall props. EffectFn1 (Props props) React.JSX
mkApp =
  mkEffectFn1 \props -> do
    context /\ settingsProvider <- mkSettingsProvider
    component <- runReaderT props."Component" { settings: context }
    pure $ settingsProvider $ component props.pageProps
