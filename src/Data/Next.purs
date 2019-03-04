module Data.Next where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Foreign (Foreign)
import Foreign.Class (class Decode)
import Foreign.Generic (defaultOptions, genericDecode)
import Foreign.Object (Object)

newtype Context = Context
  { err :: Maybe Foreign
  , req :: Maybe Foreign
  , res :: Maybe Foreign
  , jsonPageRes :: Maybe Foreign
  , pathname :: Maybe String
  , query :: Maybe (Object String)
  , asPath :: Maybe String }

derive instance genericContext :: Generic Context _
derive instance newtypeContext :: Newtype Context _

instance decodeContext :: Decode Context where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
