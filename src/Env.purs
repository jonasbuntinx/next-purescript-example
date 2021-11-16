module Env where

import Context.Settings as Settings

type Env =
  { settings :: Settings.Context
  }
