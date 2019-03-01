module Pages.Home (home) where

import Prelude

import Data.Either (Either(..))
import Data.Next (Context(..))
import Effect.Aff (Aff)
import Effect.Console (log)
import Effect.Unsafe (unsafePerformEffect)
import Next.Components as N
import Next.Utils as Next
import React.Basic (Component, JSX, Self, createComponent, make)
import React.Basic.DOM as R

type Props = { header :: String }

component :: Component Props
component = createComponent "Home"

home :: Props -> JSX
home = Next.withInitialProps getInitialProps $ make component { initialState: unit, render }

  where

    render :: forall state. Self Props state -> JSX
    render self = 
      R.div_ 
        [ R.h1_ [ R.text self.props.header ]
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
          pure { header: "Home" }
        Left e -> do
          let _ = unsafePerformEffect $ log $ e
          pure { header: "Error" }
