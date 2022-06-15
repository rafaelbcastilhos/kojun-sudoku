module Main where

import ModuloTabuleiro
import ModuloResolvedor

main = do
    putStrLn "Resolvendo Tabuleiro 6x6:"
    mapM_ print (resolvedor tabuleiro6x6Valores tabuleiro6x6Grupos)
    putStr("\n\n")
    putStrLn "Resolvendo Tabuleiro 8x8:"
    mapM_ print (resolvedor tabuleiro8x8Valores tabuleiro8x8Grupos)
    putStr("\n\n")
    putStrLn "Resolvendo Tabuleiro 10x10:"
    mapM_ print (resolvedor tabuleiro10x10Valores tabuleiro10x10Grupos)