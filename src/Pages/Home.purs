module Pages.Home (mkHome) where

import Prelude
import Data.Either (Either(..))
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Console as Console
import Next.Components as N
import Next.Data (Context(..), attachGetInitialProps)
import React.Basic.DOM as R
import React.Basic.Hooks as React

type Props
  = { header :: String }

mkHome :: Effect (React.ReactComponent Props)
mkHome = do
  c <-
    React.component "Home" \props -> React.do
      pure $ render props
  attachGetInitialProps getInitialProps c
  where
  render props =
    R.div_
      [ R.h1_ [ R.text props.header ]
      , R.p_ [ R.text "Welcome to my Next.js with Purescript Example App!" ]
      , R.br {}
      , N.link
          { href: "/about"
          , children:
            R.a { children: [ R.text "> about" ] }
          }
      ]

  getInitialProps ctx = do
    liftEffect
      $ case ctx of
          Left err -> Console.log err
          Right (Context { pathname }) -> Console.log $ fromMaybe "no pathname" pathname
    pure $ { header: "Home" }
