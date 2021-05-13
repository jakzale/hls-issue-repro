{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveLift    #-}
{-# LANGUAGE DerivingVia   #-}
module Foo where

import           FooId

import           Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as BL
import           Deriving.Aeson

import           Language.Haskell.TH.Syntax (Lift)

data Foo = Foo
  { foo :: FooId
  , bar :: String
  } deriving (Show, Generic, Lift)
  deriving (FromJSON, ToJSON)
  via CustomJSON '[FieldLabelModifier (CamelToSnake)] Foo

testFoo :: Foo
testFoo = Foo (FooId 1) "two"

putFoo :: IO ()
putFoo = BL.putStrLn $ encode testFoo

