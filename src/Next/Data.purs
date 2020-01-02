module Next.Data where

import Prelude
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype, wrap)
import Foreign (Foreign)
import Foreign.Generic (class Decode, decode)
import Foreign.Object (Object)

newtype Context
  = Context
  { err :: Maybe Foreign
  , req :: Maybe Foreign
  , res :: Maybe Foreign
  , pathname :: Maybe String
  , query :: Maybe (Object String)
  , asPath :: Maybe String
  }

derive instance newtypeContext :: Newtype Context _

instance decodeContext :: Decode Context where
  decode = decode >>> map wrap
