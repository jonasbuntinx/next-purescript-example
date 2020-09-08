{ name = "next-purescript-example"
, dependencies =
    [ "aff-promise"
    , "console"
    , "effect"
    , "foreign-generic"
    , "prelude"
    , "psci-support"
    , "react-basic-dom"
    , "react-basic-hooks"
    , "milkis"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
