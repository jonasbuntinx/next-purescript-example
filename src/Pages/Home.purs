module Pages.Home (home, getInitialProps) where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

type Props = Unit

component :: Component Props
component = createComponent "Home"

home :: Props -> JSX
home props = props # makeStateless component \_ ->
  R.div_ 
    [ R.text "Welcome to next.js!"
    , R.br {} 
    , R.a { href: "/about", children: [ R.text "About" ] }
    ]

getInitialProps :: Effect Props
getInitialProps = do
  log "FOOBAR"
  pure unit
