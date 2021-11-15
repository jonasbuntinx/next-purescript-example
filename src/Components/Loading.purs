module Components.Loading (mkLoading) where

import Prelude
import Data.Monoid (guard)
import Data.Tuple.Nested ((/\))
import Next.Router (onRouteChangeStart, routeChangeComplete, routeChangeError)
import React.Basic.DOM as R
import React.Basic.DOM.SVG as S
import React.Basic.Hooks as React

mkLoading :: React.Component Unit
mkLoading =
  React.component "Loading" \_ -> React.do
    isLoading /\ setIsLoading <- React.useState' false
    React.useEffectOnce do
      onRouteChangeStart \_ -> setIsLoading true
    React.useEffectOnce do
      routeChangeComplete \_ -> setIsLoading false
    React.useEffectOnce do
      routeChangeError \_ -> setIsLoading false
    pure
      $ R.div
          { className:
              "fixed top-0 left-0 right-0 pointer-events-none transition-opacity delay-500"
                <>
                  if isLoading then
                    " opacity-1"
                  else
                    " opacity-0"
          , children:
              [ guard isLoading
                  $ S.svg
                      { className: "animate-spin mt-1 mx-auto h-5 w-5 text-teal-500"
                      , xmlns: "http://www.w3.org/2000/svg"
                      , fill: "none"
                      , viewBox: "0 0 24 24"
                      , children:
                          [ S.circle
                              { className: "opacity-25"
                              , cx: "12"
                              , cy: "12"
                              , r: "10"
                              , stroke: "currentColor"
                              , strokeWidth: "4"
                              }
                          , S.path
                              { className: "opacity-75"
                              , fill: "currentColor"
                              , d: "M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                              }
                          ]
                      }
              ]
          }
