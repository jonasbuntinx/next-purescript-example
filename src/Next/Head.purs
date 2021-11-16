module Next.Head where

import Prim.Row (class Union)
import React.Basic.Hooks (JSX, ReactComponent, element)

type Props_head =
  ( children :: Array JSX
  )

head ::
  forall attrs attrs_.
  Union attrs attrs_ Props_head =>
  Record attrs ->
  JSX
head attrs = element _head attrs

foreign import _head :: forall attrs. ReactComponent attrs
