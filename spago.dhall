{ name = "next-purescript-example"
, dependencies =
    [ "aff-promise"
    , "affjax"
    , "console"
    , "effect"
    , "prelude"
    , "react-basic-dom"
    , "react-basic-hooks"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
