-- | This is a sample library module.
--
module Lib where


-- | Outputs a greeting.
greeting :: String -> String -> IO ()
greeting g w = putStrLn $ compileMessage g w


-- | Compiles a message.
--
-- >>> compileMessage "" ""
-- " !"
-- >>> compileMessage "Hello" "World"
-- "Hello World!"
compileMessage :: String -> String -> String
compileMessage g w = g <> " " <> w <> "!"
