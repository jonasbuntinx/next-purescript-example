{ name = "next-purescript-example"
, dependencies =
  [ "aff"
  , "aff-promise"
  , "affjax"
  , "affjax-node"
  , "console"
  , "effect"
  , "either"
  , "http-methods"
  , "maybe"
  , "node-http"
  , "prelude"
  , "react-basic-dom"
  , "react-basic-hooks"
  , "transformers"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
