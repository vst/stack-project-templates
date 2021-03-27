module Main where

import           Data.Version        (showVersion)
import           Lib                 (greeting)
import qualified Options.Applicative as OA
import           Paths_{{name-as-varid}}     (version)
import           System.Exit         (ExitCode, exitSuccess, exitWith)


-- | Main program entry point.
main :: IO ()
main = exitWith =<< (cliProgram =<< OA.execParser cliProgramParserInfo)


-- | CLI program.
cliProgram :: CliArguments -> IO ExitCode
cliProgram (CliArguments (CommandCmd1 w))      = greeting "Hello" w >> exitSuccess
cliProgram (CliArguments (CommandCmd2 (g, w))) = greeting g w >> exitSuccess


-- | Registry of commands and their arguments.
data Command =
    CommandCmd1 String
  | CommandCmd2 (String, String)
  deriving Show


-- | CLI arguments parser.
parserProgramOptions :: OA.Parser CliArguments
parserProgramOptions = CliArguments <$> OA.hsubparser
  (  OA.command "cmd1" (OA.info (CommandCmd1 <$> optsCmd1) (OA.progDesc "Say hello to someone"))
  <> OA.command "cmd2" (OA.info (CommandCmd2 <$> optsCmd2) (OA.progDesc "Send greetings to someone"))
  )


-- | @cmd1@ command arguments parser.
optsCmd1 :: OA.Parser String
optsCmd1 = OA.strOption (OA.long "who" <> OA.short 'w' <> OA.metavar "WHO" <> OA.help "Whom to greet")


-- | @cmd1@ command arguments parser.
optsCmd2 :: OA.Parser (String, String)
optsCmd2 = (,)
  <$> OA.strOption (OA.long "greeting" <> OA.short 'g' <> OA.metavar "GREETING" <> OA.help "Greeting")
  <*> OA.strOption (OA.long "who" <> OA.short 'w' <> OA.metavar "WHO" <> OA.help "Whom to greet")


-- | Parsed command line arguments.
newtype CliArguments = CliArguments { cliArgumentsCommand :: Command } deriving Show


-- | CLI program information.
cliProgramParserInfo :: OA.ParserInfo CliArguments
cliProgramParserInfo = OA.info
  (OA.helper <*> parserVersionOption <*> parserProgramOptions)
  (OA.fullDesc <> OA.progDesc "{{name}}" <> OA.header "{{name}} - CHANGE ME")


-- | Version option.
parserVersionOption :: OA.Parser (a -> a)
parserVersionOption = OA.infoOption (showVersion version) (OA.long "version" <> OA.help "Show version")
