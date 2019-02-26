module Pages.About (default) where

import Prelude

import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

type Props = Unit

component :: Component Props
component = createComponent "About"

about :: Props -> JSX
about props = props # makeStateless component \_ ->
  R.div_ [ R.text "About" ]

default = about
