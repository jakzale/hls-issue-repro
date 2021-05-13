{-# LANGUAGE TemplateHaskell #-}
module Bar where

import           Data.Aeson.THReader
import           Foo

defaultFoo :: Foo
defaultFoo = $$(readJSONFromFile "data/foo.json")
