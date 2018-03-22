{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
module ProtocolClass where

import qualified Data.Map as Map
import Data.IORef
import System.IO.Unsafe
import Control.Monad.Reader
import Control.Monad.IO.Class

type TransactionRoot = ByteString
type UtcTime = Int
type BlockHash = ByteString
type BlockHeader = ByteString
type Operation = ByteString
type ByteString = Int

type Env = IORef (Map.Map Int ByteString)

newtype Service a = Service (ReaderT Env IO a) 
  deriving(Monad, MonadReader Env, Applicative, Functor, MonadIO)

class Context m where
  type State m
  type Key m

  get :: Key m -> m (Maybe ByteString)
  set :: Key m -> ByteString -> m (State m)
  del :: Key m -> m (State m)

data RawBlockHeader = RawBlockHeader 
  { predecessor :: BlockHash
  , header      :: ByteString
  , operations  :: TransactionRoot
  , timestamp   :: UtcTime
  }

type Score = [ByteString]

class Protocol m where
  type Transaction m

  parseBlockHeader :: RawBlockHeader -> m (Maybe BlockHeader)
  parseTransaction :: ByteString -> m (Maybe (Transaction m))
  apply :: Maybe BlockHeader -> [Operation] -> m (Maybe (State m))
  -- score :: m Score

instance Context Service where
  type State Service = Map.Map Int ByteString
  type Key Service = Int

  get k = do 
    state <- ask
    s <- liftIO $ readIORef state
    pure $ Map.lookup k s

  set k v = do
    state <- ask
    s <- liftIO $ readIORef state
    let s' = Map.insert k v s
    liftIO $ writeIORef state s'
    pure s'

  del = undefined
