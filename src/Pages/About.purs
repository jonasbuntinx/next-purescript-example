module Pages.About (mkAbout) where

import Prelude
import Effect (Effect)
import Next.Link (link) as N
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkAbout :: Effect (React.ReactComponent {})
mkAbout = do
  React.component "About" \props -> React.do
    pure $ render props
  where
  render _ =
    R.div_
      [ R.h1_ [ R.text "About" ]
      , R.p_ [ R.text "This is a simple example app using Next.js with Purescript." ]
      , R.br {}
      , N.link
          { href: "/home"
          , children:
            R.a { children: [ R.text "> home" ] }
          }
      ]
