module Pages.Home (default) where

import Prelude

import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

type Props = Unit

component :: Component Props
component = createComponent "Home"

home :: Props -> JSX
home props = props # makeStateless component \_ ->
  R.div_ [ R.text "Welcome to next.js!" ]

default = home
