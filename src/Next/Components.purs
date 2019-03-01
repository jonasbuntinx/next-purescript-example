module Next.Components where

import Prim.Row (class Union)
import React.Basic (JSX)
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

foreign import link
  :: forall props props_
   . Union props props_ (SharedProps Props_link)
  => Record props
  -> JSX
