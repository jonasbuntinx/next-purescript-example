module Next.App where

import Components.Page as Page

type AppProps props =
  { "Component" :: Page.Component props
  , pageProps :: props
  }
