{-# LANGUAGE DeriveLift    #-}
{-# LANGUAGE DerivingVia   #-}
{-# LANGUAGE UnboxedTuples #-}
module FooId where

import           Data.Aeson
import           Language.Haskell.TH.Syntax (Lift)

newtype FooId = FooId Int
  deriving (Lift, Show)
  deriving (FromJSON, ToJSON) via Int

