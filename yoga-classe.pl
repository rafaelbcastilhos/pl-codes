% Definindo as cores das calças.
calca(azul).
calca(verde).
calca(amarela).
calca(branca).
calca(vermelha).

% Definindo os nomes da alunas.
nome(roberta).
nome(isabela).
nome(alice).
nome(giovana).
nome(marta).

% Definindo as posições de yoga.
posicao(corvo).
posicao(arvore).
posicao(lotus).
posicao(triangulo).
posicao(ponte).

% Definindo os anos de matrícula.
matricula(2012).
matricula(2013).
matricula(2014).
matricula(2015).
matricula(2016).

% Definindo as idades das alunas.
idade(24).
idade(48).
idade(42).
idade(30).
idade(36).

% Definindo as profissões das alunas.
profissao(arquiteta).
profissao(psicologa).
profissao(comerciante).
profissao(manicure).
profissao(motorista).

% X está ao lado de Y.
aoLado(X, Y, Lista) :-
    nextto(X,Y,Lista);
    nextto(Y,X,Lista).

% X está à esquerda de Y (em qualquer posição à esquerda).
aEsquerda(X, Y, Lista) :-
    nth0(IndexX,Lista,X),
    nth0(IndexY,Lista,Y),
    IndexX < IndexY.

% X está exatamente à esquerda de Y.
aEsquerdaExatamente(X, Y, Lista) :-
    nth0(IndexX,Lista,X),
    nth0(IndexY,Lista,Y),
    IndexX =:= IndexY - 1.

% X está à direita de Y (em qualquer posição à direita).
aDireita(X, Y, Lista) :- aEsquerda(Y,X,Lista).

% X está entre Y e Z, nessa ordem.
entre(X, Y, Z, Lista) :-
    aEsquerda(X, Z, Lista),
    aDireita(X, Y, Lista).

% Verifica se todos elementos da lista são diferentes.
todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao() :-

    %    Lista da solução do problema da aula de yoga.
    ListaSolucao = [
        aluna(Calca1, Nome1, Posicao1, Matricula1, Idade1, Profissao1),
        aluna(Calca2, Nome2, Posicao2, Matricula2, Idade2, Profissao2),
        aluna(Calca3, Nome3, Posicao3, Matricula3, Idade3, Profissao3),
        aluna(Calca4, Nome4, Posicao4, Matricula4, Idade4, Profissao4),
        aluna(Calca5, Nome5, Posicao5, Matricula5, Idade5, Profissao5)
    ],

    %    A aluna de calça Branca está em algum lugar à esquerda da aluna que se matriculou em 2014.
    aEsquerda(aluna(branca, _, _, _, _, _), aluna(_, _, _, 2014, _, _), ListaSolucao),

    %    Isabela está no segundo lugar.
    Nome2 = isabela,

    %    Marta é Motorista.
    member(aluna(_, marta, _, _, _, motorista), ListaSolucao),

    %    A aluna de calça Verde está em algum lugar entre a Arquiteta e a mulher de 36 anos, nessa ordem.
    entre(aluna(verde, _, _, _, _, _), aluna(_, _, _, _, _, arquiteta), aluna(_, _, _, _, 36, _), ListaSolucao),

    %    No quarto lugar está a mulher de 30 anos.
    Idade4 = 30,

    %    A Manicure está exatamente à esquerda da aluna que gosta de fazer a Ponte.
    aEsquerdaExatamente(aluna(_, _, _, _, _, manicure), aluna(_, _, ponte, _, _, _), ListaSolucao),

    %    A aluna de calça Azul está ao lado da aluna de 48 anos.
    aoLado(aluna(azul, _, _, _, _, _), aluna(_, _, _, _, 48, _), ListaSolucao),

    %    A Psicóloga está em algum lugar entre a aluna matriculada a mais tempo e a Comerciante, nessa ordem.
    entre(aluna(_, _, _, _, _, psicologa), aluna(_, _, _, 2012, _, _), aluna(_, _, _, _, _, comerciante), ListaSolucao),

    %    A Motorista está em algum lugar à direita da aluna de calça Branca.
    aDireita(aluna(_, _, _, _, _, motorista), aluna(branca, _, _, _, _, _), ListaSolucao),

    %    A aluna que gosta da posição Lotus está exatamente à esquerda da aluna que gosta da posição Triângulo.
    aEsquerdaExatamente(aluna(_, _, lotus, _, _, _), aluna(_, _, triangulo, _, _, _), ListaSolucao),

    %    A mulher que se matriculou em 2013 está no quarto lugar.
    Matricula4 = 2013,

    %    A aluna de calça Amarela está em algum lugar entre a aluna matriculada mais recentemente e a aluna de calça Branca, nessa ordem.
    entre(aluna(amarela, _, _, _, _, _), aluna(_, _, _, 2016, _, _), aluna(branca, _, _, _, _, _), ListaSolucao),

    %    A mulher de 42 anos gosta da posição Lotus.
    member(aluna(_, _, lotus, _, 42, _), ListaSolucao),

    %    Alice está em algum lugar à direita da aluna de calça Verde.
    aDireita(aluna(_, alice, _, _, _, _), aluna(verde, _, _, _, _, _), ListaSolucao),

    %    A aluna que gosta da posição Corvo está no primeiro lugar.
    Posicao1 = corvo,

    %    As mulheres de 42 e 48 anos estão lado a lado.
    aoLado(aluna(_, _, _, _, 42, _), aluna(_, _, _, _, 48, _), ListaSolucao),

    %    Quem se matriculou em 2016 está em algum lugar entre quem se matriculou em 2012 e quem se matriculou em 2015, nessa ordem.
    entre(aluna(_, _, _, 2016, _, _), aluna(_, _, _, 2012, _, _), aluna(_, _, _, 2015, _, _), ListaSolucao),

    %    A aluna que gosta da posição Árvore está em algum lugar à esquerda da aluna de calça Branca.
    aEsquerda(aluna(_, _, arvore, _, _, _), aluna(branca, _, _, _, _, _), ListaSolucao),

    %    Giovana está ao lado da Comerciante.
    aoLado(aluna(_, giovana, _, _, _, _), aluna(_, _, _, _, _, comerciante), ListaSolucao),

    %    Testa todas as possibilidades de calça
    calca(Calca1), calca(Calca2), calca(Calca3), calca(Calca4), calca(Calca5),
    todosDiferentes([Calca1, Calca2, Calca3, Calca4, Calca5]),

    %    Testa todas as possibilidades de nome
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),

    %    Testa todas as possibilidades de posição
    posicao(Posicao1), posicao(Posicao2), posicao(Posicao3), posicao(Posicao4), posicao(Posicao5),
    todosDiferentes([Posicao1, Posicao2, Posicao3, Posicao4, Posicao5]),

    %    Testa todas as possibilidades de matrícula
    matricula(Matricula1), matricula(Matricula2), matricula(Matricula3), matricula(Matricula4), matricula(Matricula5),
    todosDiferentes([Matricula1, Matricula2, Matricula3, Matricula4, Matricula5]),

    %    Testa todas as possibilidades de idade
    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    %    Testa todas as possibilidades de profissão
    profissao(Profissao1), profissao(Profissao2), profissao(Profissao3), profissao(Profissao4), profissao(Profissao5),
    todosDiferentes([Profissao1, Profissao2, Profissao3, Profissao4, Profissao5]),

    %    Mostrar saída de forma com que cada aluna fique em uma linha diferente.
    maplist(writeln, ListaSolucao).