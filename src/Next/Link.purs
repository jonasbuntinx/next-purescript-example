module Next.Link where

import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)

type Props_link
  = ( children :: JSX
    , href :: String
    , as :: String
    , prefetch :: Boolean
    , replace :: Boolean
    , passHref :: Boolean
    , scroll :: Boolean
    )

link ::
  forall attrs attrs_.
  Union attrs attrs_ Props_link =>
  Record attrs ->
  JSX
link attrs = element linkComponent attrs

foreign import linkComponent :: forall attrs. ReactComponent attrs
