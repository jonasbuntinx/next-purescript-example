module Website.Env where

import Website.Context.Settings as Settings

type Env
  = { settings :: Settings.Context
    }
