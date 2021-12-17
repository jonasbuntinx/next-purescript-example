module Pages.Error (mkError) where

import Prelude
import Affjax.StatusCode (StatusCode(..))
import Components.Page as Page
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkError :: StatusCode -> Page.Component Unit
mkError statusCode = do
  Page.component "Error" \_ _ -> pure render
  where
  render =
    React.fragment
      [ R.div
          { className: "max-w-5xl flex mx-auto my-12"
          , children:
              [ R.div
                  { className: "mr-1 text-slate-100 w-3/5 shadow-2xl bg-slate-800 p-12 text-left"
                  , children:
                      [ R.h1
                          { className: "text-3xl font-bold"
                          , children:
                              [ R.text case statusCode of
                                  StatusCode 404 -> "404: Not Found"
                                  StatusCode 500 -> "500: Internal Server Error"
                                  _ -> "Error"
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
