{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}

module Models where

import Data.Aeson
import Data.Text

import Database.Persist.TH

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
User
  username Text
  email    Text
  password Text
  bio      Text Maybe

  UniqueUsername username

  deriving Eq Read Show
|]

instance FromJSON User where
  parseJSON = withObject "User" $ \ v ->
    User <$> v .:  "username"
         <*> v .:  "email"
         <*> v .:  "password"
         <*> v .:? "bio"

instance ToJSON User where
    toJSON (User username email password bio) =
        object [ "username" .= username
               , "bio" .= bio
               ]
