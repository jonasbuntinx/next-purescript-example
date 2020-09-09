module Page.NotFound (mkNotFound) where

import Prelude
import Component.App as App
import Component.Navigation (mkNavigation)
import Effect.Class (liftEffect)
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkNotFound :: App.Component Unit
mkNotFound = do
  navigation <- liftEffect mkNavigation
  App.component "NotFound" \_ _ -> React.do
    pure $ render { navigation }
  where
  render slots =
    React.fragment
      [ slots.navigation unit
      , R.div
          { className: "max-w-5xl flex mx-auto my-12"
          , children:
              [ R.div
                  { className: "mr-1 text-gray-100 w-3/5 shadow-2xl bg-gray-800 p-12 text-left"
                  , children:
                      [ R.h1
                          { className: "text-3xl font-bold"
                          , children:
                              [ R.text "404: Not found"
                              ]
                          }
                      , R.div
                          { className: "w-4/5 pt-3 border-b-2 border-teal-500"
                          }
                      , R.p
                          { className: "pt-4 text-sm"
                          , children:
                              [ R.text "Looks like you took a wrong turn somewhere."
                              ]
                          }
                      ]
                  }
              , R.div
                  { className: "w-2/5"
                  , children:
                      [ R.img
                          { className: "shadow-2xl"
                          , src: "https://source.unsplash.com/O35rT6OytRo"
                          }
                      ]
                  }
              ]
          }
      ]
