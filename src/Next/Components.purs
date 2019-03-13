module Next.Components where

import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (SharedProps)

type Props_link =
  ( children :: JSX
  , href :: String
  , as :: String
  , prefetch :: Boolean
  , replace :: Boolean
  , passHref :: Boolean
  , scroll :: Boolean
  )

link
  :: forall props props_
   . Union props props_ (SharedProps Props_link)
  => Record props
  -> JSX
link props = element linkComponent props

foreign import linkComponent :: forall props. ReactComponent props

type Props_html =
  ( children :: Array JSX
  )

html
  :: forall props props_
   . Union props props_ (SharedProps Props_html)
  => Record props
  -> JSX
html props = element htmlComponent props

foreign import htmlComponent :: forall props. ReactComponent props

type Props_head =
  ( children :: Array JSX
  , nonce :: String
  , crossOrigin :: String
  )

head
  :: forall props props_
   . Union props props_ (SharedProps Props_head)
  => Record props
  -> JSX
head props = element headComponent props

foreign import headComponent :: forall props. ReactComponent props

type Props_main =
  ( children :: Array JSX )

main
  :: forall props props_
   . Union props props_ (SharedProps Props_main)
  => Record props
  -> JSX
main props = element mainComponent props

foreign import mainComponent :: forall props. ReactComponent props

type Props_nextScript =
  ( children :: Array JSX
  , nonce :: String
  , crossOrigin :: String
  )

nextScript
  :: forall props props_
   . Union props props_ (SharedProps Props_nextScript)
  => Record props
  -> JSX
nextScript props = element nextScriptComponent props

foreign import nextScriptComponent :: forall props. ReactComponent props
