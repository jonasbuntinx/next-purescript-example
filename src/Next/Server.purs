module Next.Server where

import Effect.Uncurried (EffectFn1)
import React.Basic.Hooks as React

-- | Document
foreign import unsafeDocument ::
  forall props.
  EffectFn1 (React.ReactComponent props) (React.ReactComponent props)
