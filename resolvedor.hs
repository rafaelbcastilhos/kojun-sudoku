-- Modulo responsável pela lógica da solução
-- Solucao adaptada, retirada em: http://www.cs.nott.ac.uk/~pszgmh/sudoku.lhs
module ModuloResolvedor where

import ModuloMatriz
import Data.List

type Escolhas = [Valor]

-- Retorna a primeira solução encontrada para o tabuleiro.
resolvedor :: Tabuleiro -> Tabuleiro -> Tabuleiro
resolvedor valores grupos = (pesquisaSolucao (reduzEscolhasPorGrupo (escolhas valores grupos) grupos) grupos)!!0

-- Preenche as celulas sem valor com uma lista contendo valores possíveis para o grupo que a celula pertence.
-- A lista de valores possíveis vai de 1 até o tamanho do bloco correspondente a célula, excluindo valores pré-existentes no grupo.
escolhas :: Tabuleiro -> Tabuleiro -> Matriz Escolhas
escolhas valores grupos = map (map choice) (zipWith zip valores grupos)
    where choice (v, p) = if v == 0 then [1..(tamanhoGrupo p grupos)] `minus` (valoresDoGrupo valores grupos p) else [v]

-- Recebe uma matriz de escolhas e a matriz de posições.
-- Invoca a função reduzEscolhasLista para cada coluna dividida por grupos.
-- Retorna matriz de escolhas com escolhas reduzidas. 
reduzEscolhasPorGrupo :: Matriz Escolhas -> Tabuleiro -> Matriz Escolhas
reduzEscolhasPorGrupo valores grupos = colunas $ colunasOrigem (map reduzEscolhasLista (gruposPorColuna valores grupos)) (tamanho valores)

-- Reduz as escolhas dos valores da lista com base em elementos unitários
reduzEscolhasLista :: Linha Escolhas -> Linha Escolhas
reduzEscolhasLista xss = [xs `minus` singles | xs <- xss]
    where singles = concat (filter umElemento xss)

minus :: Escolhas -> Escolhas -> Escolhas
xs `minus` ys = if umElemento xs then xs else xs \\ ys

-- Verifica se a lista possui apenas um elemento
umElemento :: [a] -> Bool
umElemento [_] = True
umElemento _ = False

-- Realiza a filtragem de todas as escolhas possíveis, uma célula por vez, retornando uma lista que contém soluções válidas para o tabuleiro.
pesquisaSolucao :: Matriz Escolhas -> Tabuleiro -> [Tabuleiro]
pesquisaSolucao valores grupos
    -- Tabuleiro informado não possui solução
    | impossivel valores grupos = []
    -- Tabuleiro informado é valido, para encontrar a solução é extraído o valor de cada lista de escolhas.
    | all (all umElemento) valores = [map concat valores]
    -- Tabuleiro informado é valido, mas é necessário expandir a matriz, reduzindo o número de escolhas restantes e continua o processo de busca sobre ela.
    | otherwise = [g | valores' <- expandeEscolhas valores, g <- pesquisaSolucao (reduzEscolhasPorGrupo valores' grupos) grupos]

-- Verifica se tabuleiro informado não possui solução
impossivel :: Matriz Escolhas -> Tabuleiro -> Bool
impossivel valores grupos = vazia valores || not (valido valores grupos)

-- Verifica se existe alguma celula vazia na matriz
vazia :: Matriz Escolhas -> Bool
vazia m = any (any null) m

-- Realiza testes para verificar se a matriz é válida:
-- * Todas células não possuem vizinhos com o mesmo valor
-- * Todos grupos não possui valores duplicados
-- * Cada grupo respeita a ordem de valores decrescentes na vertical
valido :: Matriz Escolhas -> Tabuleiro -> Bool
valido valores grupos = all (vizinhoValido) (colunas valores) &&
        all (vizinhoValido) (linhas valores) &&
        all (linhaValida) (matrizGrupos valores grupos) &&
        all (linhaDescrescente) (gruposPorColuna valores grupos)

-- Verifica se os vizinhos não possuem o mesmo valor
vizinhoValido :: Eq a => Linha [a] -> Bool
vizinhoValido [] = True
vizinhoValido [a] = True
vizinhoValido (a:b:bs) 
    | (length a <= 1) && (length b <= 1) = if a == b then False else vizinhoValido (b:bs)
    | otherwise = vizinhoValido (b:bs)

-- Verifica se não há valores duplicados na linha
linhaValida :: Eq a => Linha [a] -> Bool
linhaValida [] = True
linhaValida (x:xs) = if (length x <= 1) then not (elem x xs) && linhaValida xs else linhaValida xs

-- Verifica se os valores da linha estão em ordem decrescente
linhaDescrescente :: Ord a => Linha [a] -> Bool
linhaDescrescente [] = True
linhaDescrescente [a] = True
linhaDescrescente (a:b:bs) 
    | (length a <= 1) && (length b <= 1) = if a < b then False else linhaDescrescente (b:bs)
    | otherwise = linhaDescrescente (b:bs)

-- Expande escolhas para a primeira célula
expandeEscolhas :: Matriz Escolhas -> [Matriz Escolhas]
expandeEscolhas m = [rows1 ++ [row1 ++ [c] : row2] ++ rows2 | c <- cs]
    where
        (rows1,row:rows2) = break (any (not . umElemento)) m
        (row1,cs:row2) = break (not . umElemento) row
