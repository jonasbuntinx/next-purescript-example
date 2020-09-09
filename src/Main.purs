module Main where

import Prelude
import Control.Promise (Promise)
import Effect (Effect)
import Effect.Uncurried (EffectFn1)
import Next.Document (Document)
import React.Basic as React
import Website.App as App
import Website.Component.Website as Website
import Website.Document as Document
import Website.Page.About as About
import Website.Page.Home as Home
import Website.Page.NotFound as NotFound
import Website.Page.Profile as Profile

mkApp :: forall props. App.Props props -> Effect React.JSX
mkApp = App.mkApp

mkDocument :: Effect Document
mkDocument = Document.mkDocument

mkHome :: Website.Component Home.Props
mkHome = Home.mkHome

getServerSidePropsForHome :: forall ctx. EffectFn1 ctx (Promise { props :: Home.Props })
getServerSidePropsForHome = Home.getServerSideProps

mkAbout :: Website.Component Unit
mkAbout = About.mkAbout

mkProfile :: Website.Component Unit
mkProfile = Profile.mkProfile

mkNotFound :: Website.Component Unit
mkNotFound = NotFound.mkNotFound
