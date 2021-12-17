module Components.Navigation (navigation) where

import Next.Link (link) as N
import React.Basic.DOM as R
import React.Basic.Hooks as React

navigation :: React.JSX
navigation =
  R.nav
    { className: "text-slate-800 w-full flex items-center justify-between py-3 px-4"
    , children:
        [ R.div
            { className: "font-extrabold text-xl"
            , children:
                [ R.text "Next.js with Purescript Example" ]
            }
        , R.ul
            { className: "flex-grow flex justify-end items-center"
            , children:
                [ R.li
                    { children:
                        [ N.link
                            { href: "/"
                            , passHref: true
                            , children:
                                R.a
                                  { className: "inline-block py-2 px-4 font-bold"
                                  , children: [ R.text "Home" ]
                                  }
                            }
                        ]
                    }
                , R.li
                    { children:
                        [ N.link
                            { href: "/about"
                            , passHref: true
                            , children:
                                R.a
                                  { className: "inline-block py-2 px-4 font-bold"
                                  , children: [ R.text "About" ]
                                  }
                            }
                        ]
                    }
                , R.li
                    { children:
                        [ N.link
                            { href: "/profile"
                            , passHref: true
                            , children:
                                R.a
                                  { className: "inline-block py-2 px-4 font-bold"
                                  , children: [ R.text "Profile" ]
                                  }
                            }
                        ]
                    }
                ]
            }
        ]
    }
