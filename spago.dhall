{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "next-purescript-example"
, dependencies =
    [ "aff-promise"
    , "console"
    , "effect"
    , "foreign-generic"
    , "prelude"
    , "psci-support"
    , "react-basic-hooks"
    , "milkis"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs"
    , "test/**/*.purs"
    ]
}
