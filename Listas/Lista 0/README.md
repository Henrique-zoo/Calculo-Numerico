# Lista 0 - Técnicas Básicas de Computação

A. Os exercícios a seguir são tarefas simples de programação. O objetivo
é aumentar sua cultura e fluência computacional, que será essencial para
o bom desenvolvimento do curso. Você pode usar a linguagem de
programação e o programa de geração de gráficos de sua preferência.

1.  Escreva um programa que computa o seno de uma variável real em 25 pontos no intervalo $[0, 2 \pi]$ e salva o resultado em um arquivo de saída. No arquivo de saída devem ser salvos, em duas colunas, o argumento e o valor do seno calculado pelo programa. Use este arquivo para traçar um gráfico da função seno.

2.  Posteriormente, escreva um programa para ler os valores do arquivo de saída do item anterior. Use os valores calculados do seno para calcular o seu arcsen. Salve o resultado no mesmo arquivo original, em uma nova coluna, mantendo os resultados anteriores inalterados. Finalmente, compare os valores dos argumentos após todo este procedimento.

3.  Escreva um programa que ordene, em ordem crescente, os valores do seno obtido no item

4.  Salve o seu resultado em um outro arquivo de saída, em uma lista de classificação, associando o número 1 ao menor valor, 2 ao segundo menor valor, e assim por diante. Trace um gráfico destes pontos e verifique se seu código está fazendo esta operação corretamente.

5.  Encontre um gerador de números aleatórios (randômicos) adequado para sua linguagem de programação e implemente-o. Gere um arquivo com 100 números aleatórios e salve o resultado num arquivo. Em geral, os geradores de números randômicos geram números no intervalo $[0, 1]$. O que você faria para aumentar a faixa de variação destes números e conseguir gerar números num intervalo $[−L,L]$, com $L$ grande?

6.  Faça um programa que gere uma matriz $N \times N$ , com $N$ um número natural fornecido pelo usuário, repleta de números aleatórios. Depois, calcule sua transposta e salve as duas matrizes em dois arquivos diferentes. Você deve ser capaz de ler novamente a matriz gerada a partir dos arquivos salvos.

7.  Escreva um programa para calcular o produto de duas matrizes quadradas de ordem $N$. Conte quantas operações elementares ($flop$) você deve fazer para realizar este cálculo. Faça esta conta para 10 valores diferentes de $N$ e trace um gráfico $flop \times N$ e observe seu comportamento.

8.  Escreva um programa para calcular as raízes de uma equação algébrica de segundo grau a partir da fórmula de Báskara. Os coeficientes devem ser introduzidos pelo teclado. Inicialmente, calcule o discriminante da equação e, caso seja estritamente maior que zero, imprima a frase *"Há duas raízes reais distintas!"* na tela e, posteriormente, imprima as duas raízes encontradas. Se o discriminante for zero, imprima a frase *"Há duas raízes reais idênticas!"* e imprima o seu valor. Finalmente, se o discriminante for negativo, imprima a frase *"Há duas raízes complexas distintas!"* e imprima as partes reais e imaginárias de cada uma das raízes.

9.  Usando arrays e uma subrotina, imprima num arquivo de saída os N primeiros números de Fibonacci, $x_i$. Posteriormente, crie uma função $f(x)$ que calcula a parte inteira da soma das raízes cúbica e quadrática destes números. Trace o seu resultado como ($x_i$, $f(x_i)$). O que você observa com o gráfico à medida em que N aumenta?
