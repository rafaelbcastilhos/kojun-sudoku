-- Módulo responsável por gerenciar matrizes
module ModuloMatriz where

import Data.List

type Tabuleiro = Matriz Valor
type Matriz a = [Linha a]
type Linha a = [a]
type Valor = Int

-- Se a matriz é quadrada, retorna a dimensão
tamanho :: Matriz m -> Int
tamanho t = length (t!!0)

-- Linhas da matriz
linhas :: Matriz m -> [Linha m]
linhas l = l

-- Transposicao das colunas da matriz
colunas :: Matriz m -> [Linha m]
colunas c = transpose c

-- Divide a matriz de valores passada de acordo com a matriz de grupos.
-- Ou seja, retorna uma matriz de blocos.
matrizGrupos :: Eq m => Matriz m -> Tabuleiro -> Matriz m
matrizGrupos valores grupos = [filtraPorGrupo grupo tuplaValores | grupo <- mapaGrupos]
  where
    tuplaValores = foldl1 (++) (zipWith zip valores grupos)
    mapaGrupos = nub (map snd tuplaValores)
    filtraPorGrupo grupo list = map fst $ filter ((== grupo) . snd) list

-- Recebe uma matriz de valores, a de posições e o número de um bloco.
-- Retorna uma lista composta pelos valores pertencentes àquele bloco.
valoresDoGrupo :: Eq m => Matriz m -> Tabuleiro -> Int -> [m]
valoresDoGrupo valores grupos id = map fst $ filter ((==id) . snd) tuplaValores 
  where
    tuplaValores = foldl1 (++) (zipWith zip valores grupos)

-- Recebe uma matriz de valores e a de posiçoes.
-- Retorna as colunas da matriz de valores divididas por blocos.
-- Ex: [[1, 2, 3], [4, 5, 6]], [[0, 0, 2], [1, 0, 2]] -> [[1,2], [3], [4], [5], [6]]
gruposPorColuna :: Eq m => Matriz m -> Tabuleiro -> [Linha m]
gruposPorColuna valores grupos = zipWith zip (colunas valores) (colunas grupos) >>= map (map fst) . groupBy (\m b -> snd m == snd b)

-- Recebe o número de um bloco e a matriz de posições.
-- Retorna o tamanho do bloco correspondente.
tamanhoGrupo :: Eq m => m -> Matriz m -> Int
tamanhoGrupo _ [] = 0
tamanhoGrupo id grupos = sum [count id p | p <- grupos]
  where count x xs = length (filter (==x) xs)

-- Recebe uma lista de colunas divididas por blocos e o tamanho do tabuleiro.
-- A partir da lista de colunas dividas por blocos, remonta as colunas originais
-- da matriz de valores
colunasOrigem :: [Linha l] -> Int -> [Linha l]
colunasOrigem bs n = pedacoLista n (concat bs)

-- Divide a lista passada em sublistas de tamanho n
pedacoLista :: Int -> [l] -> [[l]]
pedacoLista n = takeWhile (not . null) . map (take n) . iterate (drop n)