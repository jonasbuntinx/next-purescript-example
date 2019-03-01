module Pages.Home (home) where

import Prelude

import Data.Either (Either(..))
import Data.Next (Context(..))
import Effect.Aff (Aff)
import Effect.Console (log)
import Effect.Unsafe (unsafePerformEffect)
import Next.Components as N
import Next.Utils as Next
import React.Basic (Component, JSX, ReactComponent, Self, createComponent, toReactComponent)
import React.Basic.DOM as R

type Props = {}

component :: Component Props
component = createComponent "Home"

home :: ReactComponent Props
home = Next.withGetInitialProps getInitialProps $ toReactComponent identity component { render } 

  where 

    render :: forall state. Self Props state -> JSX
    render self = 
      R.div_ 
        [ R.h1_ [ R.text "Home" ]
        , R.p_ [ R.text "Welcome to my Next.js with Purescript Example App!" ]
        , R.br {} 
        , N.link 
          { href: "/about" 
          , children: 
            R.a { children: [ R.text "> about" ] }
          } 
        ]

    getInitialProps :: Either String Context -> Aff Props
    getInitialProps ctx = 
      case ctx of 
        Right (Context { pathname }) -> do
          let _ = unsafePerformEffect $ log $ pathname
          pure {}
        Left e -> do
          let _ = unsafePerformEffect $ log $ e
          pure {}
