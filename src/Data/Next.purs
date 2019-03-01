module Data.Next where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Newtype (class Newtype)
import Foreign (Foreign)
import Foreign.Class (class Decode)
import Foreign.Generic (defaultOptions, genericDecode)

newtype Context = Context
  { err :: Foreign
  , req :: Foreign
  , res :: Foreign
  , pathname :: String
  , query :: Foreign
  , asPath :: String }

derive instance genericContext :: Generic Context _
derive instance newtypeContext :: Newtype Context _

instance decodeContext :: Decode Context where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
