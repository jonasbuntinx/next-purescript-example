module Pages.Contact (mkContact) where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Console as Console
import Next.Server (Context(..), attachGetInitialProps)
import React.Basic.DOM as R
import React.Basic.DOM.SVG as SVG
import React.Basic.Hooks as React

type Props
  = { header :: String }

mkContact :: Effect (React.ReactComponent Props)
mkContact =
  attachGetInitialProps getInitialProps
    =<< React.component "Contact" \props -> React.do
        pure $ render props
  where
  render props =
    R.div
      { className: "max-w-4xl flex items-center h-auto lg:h-screen flex-wrap mx-auto my-32 lg:my-0"
      , children:
        [ R.div
            { className: "w-full lg:w-3/5 rounded-lg lg:rounded-l-lg lg:rounded-r-none shadow-2xl bg-gray-900 mx-6 lg:mx-0"
            , children:
              [ R.div
                  { className: "p-4 md:p-12 text-center lg:text-left"
                  , children:
                    [ R.div
                        { className: "block lg:hidden rounded-full shadow-xl mx-auto -mt-16 h-48 w-48 bg-cover bg-center"
                        , style: R.css { backgroundImage: "url('https://source.unsplash.com/MP0IUfwrn0A')" }
                        }
                    , R.h1
                        { className: "text-3xl font-bold pt-8 lg:pt-0"
                        , children:
                          [ R.text "Jonas Buntinx"
                          ]
                        }
                    , R.div
                        { className: "mx-auto lg:mx-0 w-4/5 pt-3 border-b-2 border-teal-500 opacity-25"
                        }
                    , R.p
                        { className: "pt-8 text-sm"
                        , children:
                          [ R.text "Totally optional short description about yourself, what you do and so on."
                          ]
                        }
                    , R.div
                        { className: "mt-6 pb-16 lg:pb-0 w-4/5 lg:w-full mx-auto flex flex-wrap items-center justify-between"
                        , children:
                          [ R.a
                              { href: "https://github.com/jonasbuntinx"
                              , target: "_blank"
                              , children:
                                [ SVG.svg
                                    { className: "h-6 fill-current text-gray-600 hover:text-teal-700"
                                    , viewBox: "0 0 24 24"
                                    , xmlns: "http://www.w3.org/2000/svg"
                                    , children:
                                      [ SVG.title
                                          { children:
                                            [ R.text "GitHub"
                                            ]
                                          }
                                      , SVG.path
                                          { d: "M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12"
                                          }
                                      ]
                                    }
                                ]
                              }
                          ]
                        }
                    ]
                  }
              ]
            }
        , R.div
            { className: "w-full lg:w-2/5"
            , children:
              [ R.img
                  { className: "rounded-none lg:rounded-lg shadow-2xl hidden lg:block"
                  , src: "https://source.unsplash.com/lylCw4zcA7I"
                  }
              ]
            }
        ]
      }

  getInitialProps ctx = do
    liftEffect
      $ case ctx of
          Nothing -> Console.log "Something went wrong"
          Just (Context { pathname }) -> Console.log pathname
    pure $ { header: "Contact" }
