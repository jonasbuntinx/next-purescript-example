module Pages.About (about) where

import Prelude
import Next.Components as N
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

type Props
  = Unit

component :: Component Props
component = createComponent "About"

about :: Props -> JSX
about props =
  props
    # makeStateless component \_ ->
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
