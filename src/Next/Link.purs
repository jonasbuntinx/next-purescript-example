module Next.Link where

import Prim.Row (class Union)
import React.Basic.Hooks (JSX, ReactComponent, element)

type Props_link =
  ( children :: JSX
  , href :: String
  , as :: String
  , passHref :: Boolean
  , prefetch :: Boolean
  , replace :: Boolean
  , scroll :: Boolean
  , shallow :: Boolean
  )

link ::
  forall attrs attrs_.
  Union attrs attrs_ Props_link =>
  Record attrs ->
  JSX
link attrs = element _link attrs

foreign import _link :: forall attrs. ReactComponent attrs
