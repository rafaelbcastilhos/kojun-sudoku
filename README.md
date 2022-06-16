# kojun-sudoku

Aplicação que utiliza a técnica de back-tracking refinanando o algoritmo de busca por força bruta com objetivo de encontrar valores possíveis que podem ser eliminados sem serem explicitamente examinados para determinar a solução do problema.

Exemplo de entrada:

![Entrada](https://raw.githubusercontent.com/rafaelbcastilhos/kojun-sudoku/main/imagens/inicial.png)

Exemplo de saída:

![Saída](https://raw.githubusercontent.com/rafaelbcastilhos/kojun-sudoku/main/imagens/solucao.png)

Para compilar:
```
ghc -o kojun main.hs resolvedor.hs tabuleiro.hs matriz.hs
```

Para executar:
```
./kojun
```
