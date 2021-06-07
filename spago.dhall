{ name = "next-purescript-example"
, dependencies =
  [ "aff"
  , "aff-promise"
  , "affjax"
  , "console"
  , "effect"
  , "either"
  , "http-methods"
  , "maybe"
  , "prelude"
  , "react-basic-dom"
  , "react-basic-hooks"
  , "transformers"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
