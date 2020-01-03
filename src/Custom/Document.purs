module Custom.Document (render) where

import Next.Components as N
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
      , R.body_
          [ N.main {}
          , N.nextScript {}
          ]
      ]
    }
