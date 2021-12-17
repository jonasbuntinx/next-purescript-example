module Pages.Profile (mkProfile) where

import Prelude
import Components.Page as Page
import React.Basic.DOM as R
import React.Basic.DOM.SVG as SVG
import React.Basic.Hooks as React

mkProfile :: Page.Component Unit
mkProfile = do
  Page.component "Profile" \_ _ -> pure render
  where
  render =
    React.fragment
      [ R.div
          { className: "text-slate-100 max-w-2xl mx-auto my-24 shadow-2xl bg-slate-800 p-12 text-left"
          , children:
              [ R.div
                  { className: "rounded-full shadow-xl mx-auto -mt-32 h-48 w-48 bg-cover bg-center"
                  , style: R.css { backgroundImage: "url('https://source.unsplash.com/lylCw4zcA7I')" }
                  }
              , R.h1
                  { className: "text-3xl font-bold"
                  , children:
                      [ R.text "Profile"
                      ]
                  }
              , R.div
                  { className: "w-1/2 pt-3 border-b-2 border-teal-500"
                  }
              , R.p
                  { className: "pt-4 font-bold flex items-center"
                  , children:
                      [ SVG.svg
                          { className: "h-4 fill-current pr-4 text-teal-500"
                          , viewBox: "0 0 20 20"
                          , xmlns: "http://www.w3.org/2000/svg"
                          , children:
                              [ SVG.path
                                  { d: "M9 12H1v6a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-6h-8v2H9v-2zm0-1H0V5c0-1.1.9-2 2-2h4V2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v1h4a2 2 0 0 1 2 2v6h-9V9H9v2zm3-8V2H8v1h4z"
                                  }
                              ]
                          }
                      , R.text "Bird"
                      ]
                  }
              , R.p
                  { className: "pt-2 font-bold flex items-center"
                  , children:
                      [ SVG.svg
                          { className: "h-4 fill-current pr-4 text-teal-500"
                          , viewBox: "0 0 20 20"
                          , xmlns: "http://www.w3.org/2000/svg"
                          , children:
                              [ SVG.path
                                  { d: "M10 20a10 10 0 1 1 0-20 10 10 0 0 1 0 20zm7.75-8a8.01 8.01 0 0 0 0-4h-3.82a28.81 28.81 0 0 1 0 4h3.82zm-.82 2h-3.22a14.44 14.44 0 0 1-.95 3.51A8.03 8.03 0 0 0 16.93 14zm-8.85-2h3.84a24.61 24.61 0 0 0 0-4H8.08a24.61 24.61 0 0 0 0 4zm.25 2c.41 2.4 1.13 4 1.67 4s1.26-1.6 1.67-4H8.33zm-6.08-2h3.82a28.81 28.81 0 0 1 0-4H2.25a8.01 8.01 0 0 0 0 4zm.82 2a8.03 8.03 0 0 0 4.17 3.51c-.42-.96-.74-2.16-.95-3.51H3.07zm13.86-8a8.03 8.03 0 0 0-4.17-3.51c.42.96.74 2.16.95 3.51h3.22zm-8.6 0h3.34c-.41-2.4-1.13-4-1.67-4S8.74 3.6 8.33 6zM3.07 6h3.22c.2-1.35.53-2.55.95-3.51A8.03 8.03 0 0 0 3.07 6z"
                                  }
                              ]
                          }
                      , R.text "Rain forest"
                      ]
                  }
              , R.p
                  { className: "pt-4 text-sm"
                  , children:
                      [ R.text "Macaws are beautiful, brilliantly colored members of the parrot family."
                      ]
                  }
              , R.p
                  { className: "pt-2 text-sm"
                  , children:
                      [ R.text "Many macaws have vibrant plumage. The coloring is suited to life in Central and South American rain forests, with their green canopies and colorful fruits and flowers. The birds boast large, powerful beaks that easily crack nuts and seeds, while their dry, scaly tongues have a bone inside them that makes them an effective tool for tapping into fruits."
                      ]
                  }
              , R.div
                  { className: "-mx-3 pt-6 pb-3 w-full mx-auto flex flex-wrap items-center"
                  , children:
                      [ R.a
                          { className: "px-3"
                          , href: "#"
                          , children:
                              [ SVG.svg
                                  { className: "h-6 fill-current text-slate-600 hover:text-teal-500"
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
                      , R.a
                          { className: "px-3"
                          , href: "#"
                          , children:
                              [ SVG.svg
                                  { className: "h-6 fill-current text-slate-600 hover:text-teal-500"
                                  , viewBox: "0 0 24 24"
                                  , xmlns: "http://www.w3.org/2000/svg"
                                  , children:
                                      [ SVG.title
                                          { children:
                                              [ R.text "Twitter"
                                              ]
                                          }
                                      , SVG.path
                                          { d: "M23.954 4.569c-.885.389-1.83.654-2.825.775 1.014-.611 1.794-1.574 2.163-2.723-.951.555-2.005.959-3.127 1.184-.896-.959-2.173-1.559-3.591-1.559-2.717 0-4.92 2.203-4.92 4.917 0 .39.045.765.127 1.124C7.691 8.094 4.066 6.13 1.64 3.161c-.427.722-.666 1.561-.666 2.475 0 1.71.87 3.213 2.188 4.096-.807-.026-1.566-.248-2.228-.616v.061c0 2.385 1.693 4.374 3.946 4.827-.413.111-.849.171-1.296.171-.314 0-.615-.03-.916-.086.631 1.953 2.445 3.377 4.604 3.417-1.68 1.319-3.809 2.105-6.102 2.105-.39 0-.779-.023-1.17-.067 2.189 1.394 4.768 2.209 7.557 2.209 9.054 0 13.999-7.496 13.999-13.986 0-.209 0-.42-.015-.63.961-.689 1.8-1.56 2.46-2.548l-.047-.02z"
                                          }
                                      ]
                                  }
                              ]
                          }
                      , R.a
                          { className: "px-3"
                          , href: "#"
                          , children:
                              [ SVG.svg
                                  { className: "h-6 fill-current text-slate-600 hover:text-teal-500"
                                  , viewBox: "0 0 24 24"
                                  , xmlns: "http://www.w3.org/2000/svg"
                                  , children:
                                      [ SVG.title
                                          { children:
                                              [ R.text "LinkedIn"
                                              ]
                                          }
                                      , SVG.path
                                          { d: "M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"
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
