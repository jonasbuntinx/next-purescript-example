module Next.Document where

import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)

type Props_html
  = ( children :: Array JSX
    )

html ::
  forall attrs attrs_.
  Union attrs attrs_ Props_html =>
  Record attrs ->
  JSX
html attrs = element htmlComponent attrs

foreign import htmlComponent :: forall attrs. ReactComponent attrs

type Props_head
  = ( children :: Array JSX
    , nonce :: String
    , crossOrigin :: String
    )

head ::
  forall attrs attrs_.
  Union attrs attrs_ Props_head =>
  Record attrs ->
  JSX
head attrs = element headComponent attrs

foreign import headComponent :: forall attrs. ReactComponent attrs

type Props_main
  = ( children :: Array JSX )

main ::
  forall attrs attrs_.
  Union attrs attrs_ Props_main =>
  Record attrs ->
  JSX
main attrs = element mainComponent attrs

foreign import mainComponent :: forall attrs. ReactComponent attrs

type Props_nextScript
  = ( children :: Array JSX
    , nonce :: String
    , crossOrigin :: String
    )

nextScript ::
  forall attrs attrs_.
  Union attrs attrs_ Props_nextScript =>
  Record attrs ->
  JSX
nextScript attrs = element nextScriptComponent attrs

foreign import nextScriptComponent :: forall attrs. ReactComponent attrs
