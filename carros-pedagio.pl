cor(amarelo).
cor(azul).
cor(branco).
cor(verde).
cor(vermelho).

tipo(crossover).
tipo(hatch).
tipo(sedan).
tipo(pickup).
tipo(suv).

motorista(cesar).
motorista(fabiano).
motorista(mateus).
motorista(otavio).
motorista(william).

sobrenome(almeida).
sobrenome(gomes).
sobrenome(machado).
sobrenome(pereira).
sobrenome(souza).

parente(avo).
parente(irmao).
parente(pai).
parente(tio).
parente(primo).

placa(aaa1111).
placa(bbb2222).
placa(ccc3333).
placa(ddd4444).
placa(eee5555).

entreExatamente(X, Y, Z, Lista) :-
    aDireitaExatamente(X, Y, Lista),
    aEsquerdaExatamente(X, Z, Lista).

% X está exatamente à esquerda de Y.
aEsquerdaExatamente(X, Y, Lista) :-
    nth0(IndexX,Lista,X),
    nth0(IndexY,Lista,Y),
    IndexX =:= IndexY - 1.

aDireitaExatamente(X,Y,Lista) :- aEsquerdaExatamente(Y,X,Lista).

% X está entre Y e Z.
entre(X, Y, Z, Lista) :-
    aEsquerda(X, Z, Lista),
    aDireita(X, Y, Lista).

%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista); nextto(Y,X,Lista).

%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.

%X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

%X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 

    ListaSolucao = [
        carro(Cor1, Tipo1, Motorista1, Sobrenome1, Parente1, Placa1),
        carro(Cor2, Tipo2, Motorista2, Sobrenome2, Parente2, Placa2),
        carro(Cor3, Tipo3, Motorista3, Sobrenome3, Parente3, Placa3),
        carro(Cor4, Tipo4, Motorista4, Sobrenome4, Parente4, Placa4),
        carro(Cor5, Tipo5, Motorista5, Sobrenome5, Parente5, Placa5)
    ],

    % Na quinta posição está o carro da placa aaa1111.
    Placa5=aaa1111,

    % O motorista que vai visitar o Irmão está ao lado do carro da placa ddd4444
    aoLado(
        carro(_, _, _, _, irmao, _),
        carro(_, _, _, _, _, ddd4444),
        ListaSolucao
    ),

    % O carro Amarelo está em algum lugar entre o carro Verde e o carro da placa ddd4444, nessa ordem.
    entre(
        carro(amarelo, _, _, _, _, _), 
        carro(verde, _, _, _, _, _), 
        carro(_, _, _, _, _, ddd4444), 
        ListaSolucao
    ),

    % Fabiano está ao lado do motorista que visitará o Avô.
    aoLado(
        carro(_, _, fabiano, _, _, _),
        carro(_, _, _, _, avo, _),
        ListaSolucao
    ),

    % Quem vai visitar o Tio está entre o carro da placa eee5555 e o motorista que visitará o Pai, nessa ordem.
    entreExatamente(
        carro(_, _, _, _, tio, _), 
        carro(_, _, _, _, _, eee5555), 
        carro(_, _, _, _, pai, _), 
        ListaSolucao
    ),

    % O motorista que vai visitar o Avô está em uma das pontas.
    noCanto(
        carro(_, _, _, _, avo, _),
        ListaSolucao
    ),

    % O motorista de sobrenome Machado está em algum lugar entre o motorista do Crossover e o motorista de sobrenome Gomes, nessa ordem.
    entre(
        carro(_, _, _, machado, _, _), 
        carro(_, crossover, _, _, _, _), 
        carro(_, _, _, gomes, _, _), 
        ListaSolucao
    ),

    % O motorista de sobrenome Pereira está em algum lugar à direita do carro de placa ccc3333.
    aDireita(
        carro(_, _, _, pereira, _, _), 
        carro(_, _, _, _, _, ccc3333), 
        ListaSolucao
    ),

    % Um dos motoristas se chama William Pereira.
    member(
        carro(_, _, william, pereira, _, _), 
        ListaSolucao
    ),

    % O carro Amarelo está em algum lugar entre o Sedan e o carro de quem vai visitar o Avô, nessa ordem.
    entre(
        carro(amarelo, _, _, _, _, _), 
        carro(_, sedan, _, _, _, _), 
        carro(_, _, _, _, avo, _), 
        ListaSolucao
    ),

    % César está ao lado de quem vai visitar o Tio.
    aoLado(
        carro(_, _, cesar, _, _, _),
        carro(_, _, _, _, tio, _),
        ListaSolucao
    ),

    % Mateus está ao lado do motorista de sobrenome Machado.
    aoLado(
        carro(_, _, mateus, _, _, _),
        carro(_, _, _, machado, _, _),
        ListaSolucao
    ),

    % O motorista do Hatch está em algum lugar à direita do carro Vermelho.
    aDireita(
        carro(_, hatch, _, _, _, _), 
        carro(vermelho, _, _, _, _, _), 
        ListaSolucao
    ),

    % O Sedan e a Pickup estão lado a lado.
    aoLado(
        carro(_, sedan, _, _, _, _),
        carro(_, pickup, _, _, _, _),
        ListaSolucao
    ),
    aoLado(
        carro(_, pickup, _, _, _, _),
        carro(_, sedan, _, _, _, _),
        ListaSolucao
    ),

    % O motorista que visitará o Irmão está ao lado do Crossover.
    aoLado(
        carro(_, _, _, _, irmao, _),
        carro(_, crossover, _, _, _, _),
        ListaSolucao
    ),

    % O carro da placa ccc3333 está ao lado do carro do motorista da família Almeida.
    aoLado(
        carro(_, _, _, _, _, ccc3333),
        carro(_, _, _, almeida, _, _),
        ListaSolucao
    ),

    % O carro Amarelo entre o Sedan e o carro Azul, nessa ordem.
    entreExatamente(
        carro(amarelo, _, _, _, _, _), 
        carro(_, sedan, _, _, _, _), 
        carro(azul, _, _, _, _, _), 
        ListaSolucao
    ),

    % O carro Vermelho está no quarto pedágio.
    Cor4 = vermelho,

    % O carro Azul está em algum lugar à esquerda do carro Branco.
    aEsquerda(
        carro(azul, _, _, _, _, _), 
        carro(branco, _, _, _, _, _), 
        ListaSolucao
    ),

    % O carro Amarelo está em algum lugar à esquerda do carro da placa bbb2222.
    aEsquerda(
        carro(amarelo, _, _, _, _, _), 
        carro(_, _, _, _, _, bbb2222), 
        ListaSolucao
    ),

    % O carro Amarelo tem a placa eee5555.
    member(
        carro(amarelo, _, _, _, _, eee5555), 
        ListaSolucao
    ),

    %Testa todas as possibilidades...
    cor(Cor1), cor(Cor2), cor(Cor3), cor(Cor4), cor(Cor5),
    todosDiferentes([Cor1, Cor2, Cor3, Cor4, Cor5]),

    tipo(Tipo1), tipo(Tipo2), tipo(Tipo3), tipo(Tipo4), tipo(Tipo5),
    todosDiferentes([Tipo1, Tipo2, Tipo3, Tipo4, Tipo5]),

    motorista(Motorista1), motorista(Motorista2), motorista(Motorista3), motorista(Motorista4), motorista(Motorista5),
    todosDiferentes([Motorista1, Motorista2, Motorista3, Motorista4, Motorista5]),

    sobrenome(Sobrenome1), sobrenome(Sobrenome2), sobrenome(Sobrenome3), sobrenome(Sobrenome4), sobrenome(Sobrenome5),
    todosDiferentes([Sobrenome1, Sobrenome2, Sobrenome3, Sobrenome4, Sobrenome5]),

    parente(Parente1), parente(Parente2), parente(Parente3), parente(Parente4), parente(Parente5),
    todosDiferentes([Parente1, Parente2, Parente3, Parente4, Parente5]),

    placa(Placa1), placa(Placa2), placa(Placa3), placa(Placa4), placa(Placa5),
    todosDiferentes([Placa1, Placa2, Placa3, Placa4, Placa5]).
