-- Modulo responsável por armazenar os valores e grupos dos tabuleiros
module ModuloTabuleiro where
import ModuloMatriz

-- Definição de Valores do Tabuleiro 6x6
-- https://www.janko.at/Raetsel/Kojun/001.a.htm
tabuleiro6x6Valores :: Tabuleiro
tabuleiro6x6Valores = [[2,0,0,0,1,0],
                        [0,0,0,3,0,0],
                        [0,3,0,0,5,3],
                        [0,0,0,0,0,0],
                        [0,0,3,0,4,2],
                        [0,0,0,0,0,0]]
-- Definição de Grupos do Tabuleiro 6x6
tabuleiro6x6Grupos :: Tabuleiro
tabuleiro6x6Grupos = [[1,1,2,2,2,3],
                        [4,4,4,4,4,3],
                        [5,6,6,6,4,7],
                        [5,5,5,6,7,7],
                        [8,8,10,0,0,0],
                        [9,9,10,10,0,0]]

-- Definição de Valores do Tabuleiro 8x8
-- https://www.janko.at/Raetsel/Kojun/004.a.htm
tabuleiro8x8Valores :: Tabuleiro
tabuleiro8x8Valores = [[2,5,0,0,3,0,0,0],
                        [0,0,6,0,0,0,0,0],
                        [0,0,5,0,5,2,0,0],
                        [0,0,0,2,0,0,0,0],
                        [0,0,1,0,4,0,0,0],
                        [3,0,2,0,0,4,0,0],
                        [0,0,0,6,0,0,0,0],
                        [0,0,0,0,4,0,3,2]]
-- Definição de Grupos do Tabuleiro 8x8
tabuleiro8x8Grupos :: Tabuleiro
tabuleiro8x8Grupos = [[0,1,1,1,1,2,3,3],
                        [0,0,5,1,2,2,4,4],
                        [6,7,5,8,2,2,9,9],
                        [6,10,5,5,5,2,9,9],
                        [6,10,5,11,11,11,9,12],
                        [13,10,14,11,14,14,12,12],
                        [13,13,14,14,14,15,15,12],
                        [13,13,16,16,15,15,15,12]]

-- Definição de Valores do Tabuleiro 10x10
-- https://www.janko.at/Raetsel/Kojun/010.a.htm
tabuleiro10x10Valores :: Tabuleiro
tabuleiro10x10Valores = [[5,0,2,0,2,0,3,1,3,1],
                        [0,4,0,1,0,5,0,5,0,4],
                        [7,5,1,7,0,0,3,1,3,0],
                        [0,4,0,0,0,0,0,0,0,3],
                        [2,0,3,4,0,2,0,0,4,0],
                        [5,0,2,0,6,0,0,0,0,0],
                        [0,1,3,0,1,0,0,4,0,3],
                        [6,7,0,3,0,1,4,0,0,1],
                        [4,0,3,0,4,0,0,0,0,3],
                        [0,1,0,2,0,6,2,0,2,1]]
-- Definição de Grupos do Tabuleiro 10x10
tabuleiro10x10Grupos :: Tabuleiro
tabuleiro10x10Grupos = [[1,2,2,2,3,3,3,3,4,4],
                        [1,1,1,2,6,6,7,7,4,7],
                        [5,5,1,6,6,9,8,7,7,7],
                        [5,5,6,6,10,9,8,8,8,11],
                        [5,5,5,6,10,10,11,11,11,11],
                        [12,12,15,15,15,10,22,22,21,21],
                        [12,12,12,15,15,16,17,18,21,21],
                        [13,13,12,15,16,16,17,18,20,20],
                        [13,13,14,14,14,14,17,18,18,19],
                        [13,13,13,14,14,14,17,17,19,19]]