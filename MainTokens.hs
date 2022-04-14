import RDF_Lexer
import RDF_Parser
import LangTokens
import LangParser
import System.Environment
import Control.Exception
import System.IO


main :: IO ()
main = catch main' noLex

main'  = do (fileName : _ ) <- getArgs 
            sourceText <- readFile fileName
            putStrLn ("Lexing : " ++ sourceText)
            let lexedProg = parseQuery(alexScanTokens sourceText)
            putStrLn ("lexed as " ++ (show lexedProg))

noLex :: ErrorCall -> IO ()
noLex e = do let err =  show e
             hPutStr stderr ("Problem with lexing: " ++ err)
             return ()