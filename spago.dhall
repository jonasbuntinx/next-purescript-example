{ name = "next-purescript-example"
, dependencies =
    [ "aff-promise"
    , "affjax"
    , "console"
    , "effect"
    , "foreign-generic"
    , "prelude"
    , "psci-support"
    , "react-basic-dom"
    , "react-basic-hooks"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
