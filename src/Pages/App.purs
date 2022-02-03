module Pages.App (mkApp) where

import Prelude
import Components.Loading (mkLoading)
import Components.Navigation (navigation)
import Context.Settings (mkSettingsProvider)
import Control.Monad.Reader (runReaderT)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Next.App as N
import React.Basic.Hooks as React

mkApp :: forall props. Effect (EffectFn1 (N.AppProps props) React.JSX)
mkApp = do
  context /\ settingsProvider <- mkSettingsProvider
  loading <- mkLoading
  pure
    $ mkEffectFn1 \props -> do
        component <- runReaderT props."Component" { settings: context }
        pure
          $ settingsProvider
          $ React.fragment
              [ loading unit
              , navigation
              , component props.pageProps
              ]
