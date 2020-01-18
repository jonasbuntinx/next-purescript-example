module Document (render) where

import Next.Document (html, head, main, nextScript) as N
import React.Basic (JSX, Self)
import React.Basic.DOM as R

render :: forall props state. Self props state -> JSX
render self =
  N.html
    { children:
      [ N.head
          { children:
            []
          }
      , R.body
          { className: "font-sans antialiased text-gray-100 leading-normal tracking-wider bg-cover"
          , style: R.css { backgroundImage: "url('https://source.unsplash.com/qLW70Aoo8BE')" }
          , children:
            [ N.main {}
            , N.nextScript {}
            ]
          }
      ]
    }
