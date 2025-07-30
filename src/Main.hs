module Main where

import qualified Control.Monad       as M
import           Options.Applicative

data Args = Args
  { verbose :: Bool
  , input   :: FilePath
  } deriving Show

optionsP :: Parser Args
optionsP = Args
  <$> switch (long "verbose" <> help "Verbose mode")
  <*> strOption (long "input" <> metavar "FILE" <> help "Input file")

main :: IO ()
main = execParser opts >>= runMain
  where
    opts = info (optionsP <**> helper)
      ( fullDesc <> progDesc "gf - the SAT Solver" <> header "example" )

runMain :: Args -> IO ()
runMain args@(Args { verbose = v, input = i }) = do
    M.when v$ do
        putStr "verbose = "
        print v
        putStr "input = "
        print i
    print args
