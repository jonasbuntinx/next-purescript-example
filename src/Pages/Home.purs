module Pages.Home (mkHome) where

import Prelude
import Effect (Effect)
import Next.Components as N
import Next.Hooks as Next
import React.Basic.DOM as R
import React.Basic.Hooks as React

type Props
  = { header :: String }

mkHome :: Effect (React.ReactComponent Props)
mkHome = do
  Next.component "Home" getInitialProps \props -> React.do
    pure $ render props
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
    pure $ { header: "Home" }
