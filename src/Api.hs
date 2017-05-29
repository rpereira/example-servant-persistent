{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE TypeOperators     #-}

module Api where

import Data.Proxy
import Data.Text
import Database.Persist
import Servant.API

import Models

type Api =
       "users" :> ReqBody '[JSON] User
               :> PostCreated '[JSON] (Maybe (Key User))

  :<|> "users" :> Capture "username" Text
               :> Get '[JSON] (Maybe User)

api :: Proxy Api
api = Proxy
