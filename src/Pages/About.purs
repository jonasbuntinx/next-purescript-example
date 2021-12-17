module Pages.About (mkAbout) where

import Prelude
import Components.Page as Page
import React.Basic.DOM as R
import React.Basic.Hooks as React

mkAbout :: Page.Component Unit
mkAbout = do
  Page.component "About" \_ _ -> pure render
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
                              [ R.text "About"
                              ]
                          }
                      , R.div
                          { className: "w-4/5 pt-3 border-b-2 border-teal-500"
                          }
                      , R.h2
                          { className: "pt-4 font-bold"
                          , children:
                              [ R.text "PureScript"
                              , R.span
                                  { className: "ml-1 text-teal-500 font-extrabold"
                                  , children:
                                      [ R.text "::"
                                      ]
                                  }
                              ]
                          }
                      , R.p
                          { className: "pt-1 text-sm"
                          , children:
                              [ R.text "A small strongly typed programming language with expressive types that compiles to JavaScript, written in and inspired by Haskell."
                              ]
                          }
                      , R.h2
                          { className: "pt-4 font-bold"
                          , children:
                              [ R.text "Next.js"
                              , R.span
                                  { className: "ml-1 text-teal-500 font-extrabold"
                                  , children:
                                      [ R.text "::"
                                      ]
                                  }
                              ]
                          }
                      , R.p
                          { className: "pt-1 text-sm"
                          , children:
                              [ R.text "Production grade React applications that scale. The world's leading companies use Next.js to build server-rendered applications, static websites, and more."
                              ]
                          }
                      ]
                  }
              , R.div
                  { className: "w-2/5"
                  , children:
                      [ R.img
                          { className: "shadow-2xl"
                          , src: "https://source.unsplash.com/rS1GogPLVHk"
                          }
                      ]
                  }
              ]
          }
      ]
