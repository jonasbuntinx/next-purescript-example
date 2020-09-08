module App (mkApp) where

import Prelude
import Context.Settings (mkSettingsProvider)
import Data.Maybe (Maybe)
import Data.Symbol (SProxy(..))
import Data.Tuple.Nested ((/\))
import Next.Head (head) as N
import Next.Server (AppProps)
import Prim.Row (class Lacks)
import React.Basic.DOM as R
import React.Basic.Hooks as React
import Record as Record

mkApp ::
  forall props.
  Lacks "context" props =>
  React.Component (AppProps { | props } { context :: React.ReactContext (Maybe String) | props })
mkApp = do
  context /\ settingsProvider <- mkSettingsProvider
  React.component "App" \props -> React.do
    pure
      $ settingsProvider
      $ React.fragment
          [ N.head
              { children:
                  [ R.title
                      { children: [ R.text "Next.js with Purescript Example" ]
                      }
                  ]
              }
          , React.element props."Component" (Record.insert (SProxy :: _ "context") context props.pageProps)
          ]
