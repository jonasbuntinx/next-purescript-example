module Next.Document where

import Prim.Row (class Union)
import React.Basic.Hooks (JSX, ReactComponent, element)

-- | Components
type Props_html =
  ( children :: Array JSX
  )

html ::
  forall attrs attrs_.
  Union attrs attrs_ Props_html =>
  Record attrs ->
  JSX
html attrs = element _html attrs

foreign import _html :: forall attrs. ReactComponent attrs

type Props_head =
  ( children :: Array JSX
  , nonce :: String
  , crossOrigin :: String
  )

head ::
  forall attrs attrs_.
  Union attrs attrs_ Props_head =>
  Record attrs ->
  JSX
head attrs = element _head attrs

foreign import _head :: forall attrs. ReactComponent attrs

type Props_main =
  ( children :: Array JSX
  )

main ::
  forall attrs attrs_.
  Union attrs attrs_ Props_main =>
  Record attrs ->
  JSX
main attrs = element _main attrs

foreign import _main :: forall attrs. ReactComponent attrs

type Props_nextScript =
  ( children :: Array JSX
  , nonce :: String
  , crossOrigin :: String
  )

nextScript ::
  forall attrs attrs_.
  Union attrs attrs_ Props_nextScript =>
  Record attrs ->
  JSX
nextScript attrs = element _nextScript attrs

foreign import _nextScript :: forall attrs. ReactComponent attrs
