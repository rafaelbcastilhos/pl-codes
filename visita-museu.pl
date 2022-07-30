% cores das bolsas
bolsa(amarela).
bolsa(azul).
bolsa(branca).
bolsa(verde).
bolsa(vermelha).

% nomes
nome(adriana).
nome(cecilia).
nome(iara).
nome(poliana).
nome(sabrina).

% idades
idade(20).
idade(28).
idade(33).
idade(45).
idade(56).

% pintores favoritos
pintor(brasileiro).
pintor(espanhol).
pintor(frances).
pintor(holandes).
pintor(italiano).

% hora de chegada
chegada(9).
chegada(9.5).
chegada(10).
chegada(10.5).
chegada(11).

% meio de transporte
transporte(bicicleta).
transporte(carro).
transporte(metro).
transporte(onibus).
transporte(trem).

%X está à ao lado de Y
lado(X,Y,Lista) :- nextto(X,Y,Lista);
                   nextto(Y,X,Lista).

%X está à esquerda de Y (em qualquer posição à esquerda)
esquerda(X,Y,Lista) :- nth0(IndexX,Lista,X),
                       nth0(IndexY,Lista,Y),
                       IndexX < IndexY.

%X está à direita de Y (em qualquer posição à direita)
direita(X,Y,Lista) :- esquerda(Y,X,Lista).

%X está no canto se ele é o primeiro ou o último da lista
ponta(X,Lista) :- last(Lista,X).
ponta(X,[X|_]).

distintos([]).
distintos([H|T]) :- not(member(H,T)), distintos(T).
solucao(Visitantes) :-

    % cada visitante é um predicado do tipo
    % visitante(Bolsa, Nome, Idade, Pintor, Chegada, Transporte)

    % a solução será então uma lista de visitantes
    Visitantes = [
        visitante(Bolsa1, Nome1, Idade1, Pintor1, Chegada1, Transporte1),
        visitante(Bolsa2, Nome2, Idade2, Pintor2, Chegada2, Transporte2),
        visitante(Bolsa3, Nome3, Idade3, Pintor3, Chegada3, Transporte3),
        visitante(Bolsa4, Nome4, Idade4, Pintor4, Chegada4, Transporte4),
        visitante(Bolsa5, Nome5, Idade5, Pintor5, Chegada5, Transporte5)
    ],

    % Sabrina está em algum lugar entre a dona da bolsa Amarela e a visitante que gosta do pintor Francês, nessa ordem.
    direita(visitante(_,sabrina,_,_,_,_),
            visitante(amarela,_,_,_,_,_),
            Visitantes),

    esquerda(visitante(_,sabrina,_,_,_,_),
             visitante(_,_,_,frances,_,_),
             Visitantes),

    % Na primeira posição está quem foi de Trem.
    Transporte1 = trem,

    % A visitante mais velha está em algum lugar à direita da visitante da bolsa Azul.
    direita(visitante(_,_,56,_,_,_),
            visitante(azul,_,_,_,_,_),
            Visitantes),

    % A mulher que chegou às 10:00 está ao lado da visitante que gosta do pintor Brasileiro.
    lado(visitante(_,_,_,_,10,_),
         visitante(_,_,_,brasileiro,_,_),
         Visitantes),

    % A visitante de 28 anos está em algum lugar entre a dona da bolsa Branca e a mulher mais nova, nessa ordem.
    direita(visitante(_,_,18,_,_,_),
            visitante(branca,_,_,_,_,_),
            Visitantes),

    esquerda(visitante(_,_,18,_,_,_),
             visitante(_,_,20,_,_,_),
             Visitantes),

    % A dona da bolsa Azul está em algum lugar à esquerda de quem chegou às 10:30.
    esquerda(visitante(azul,_,_,_,_,_),
             visitante(_,_,_,_,10.5,_),
             Visitantes),

    % Quem foi de Metrô está ao lado de quem gosta do pintor Brasileiro.
    lado(visitante(_,_,_,_,_,metro),
         visitante(_,_,_,brasileiro,_,_),
         Visitantes),

    % Adriana está ao lado de quem foi de Bicicleta.
    lado(visitante(_,adriana,_,_,_,_),
         visitante(_,_,_,_,_,bicicleta),
         Visitantes),

    % Cecília está em uma das pontas.
    ponta(visitante(_,cecilia,_,_,_,_), Visitantes),

    % A visitante que gosta do pintor Brasileiro está em algum lugar entre a mulher de 45 anos e a mulher que gosta do pintor Italiano, nessa ordem.
    direita(visitante(_,_,_,brasileiro,_,_),
            visitantes(_,_,45,_,_,_),
            Visitantes),

    esquerda(visitante(_,_,_,brasileiro,_,_),
             visitante(_,_,_,italiano,_,_),
             Visitantes),

    % A mulher de 33 anos está ao lado da mulher que foi de Ônibus para a exposição.
    lado(visitante(_,_,33,_,_,_),
         visitante(_,_,_,_,_,onibus),
         Visitantes),

    % A visitante da bolsa Verde gosta do pintor Francês.
    member(visitante(verde,_,_,frances,_,_), Visitantes),

    % Quem foi de Carro está ao lado de quem chegou às 10:00.
    lado(visitante(_,_,_,_,_,carro),
         visitante(_,_,_,_,10,_),
         Visitantes),

    % Poliana está em algum lugar à direita da mulher de bolsa Azul.
    direita(visitante(_,poliana,_,_,_,_),
            visitante(azul,_,_,_,_,_),
            Visitantes),

    % Quem foi de Bicicleta está em algum lugar entre quem foi de Metrô e quem foi de Ônibus, nessa ordem.
    direita(visitante(_,_,_,_,_,bicicleta),
            visitante(_,_,_,_,_,metro),
            Visitantes),
    esquerda(visitante(_,_,_,_,_,bicicleta),
             visitante(_,_,_,_,_,onibus),
             Visitantes),

    % A visitante que chegou mais cedo está ao lado da visitante de bolsa Vermelha.
    lado(visitante(_,_,_,_,9,_),
         visitante(vermelha,_,_,_,_,_),
         Visitantes),

    % Iara está ao lado da mulher de bolsa Azul.
    lado(visitante(_,iara,_,_,_,_),
         visitante(azul,_,_,_,_,_),
         Visitantes),

    % A visitante que foi de Bicicleta está exatamente à esquerda da visitante de bolsa Verde.
    esquerda(visitante(_,_,_,_,_,bicicleta),
             visitante(verde,_,_,_,_,_),
             Visitantes),
    lado(visitante(_,_,_,_,_,bicicleta),
        visitante(verde,_,_,_,_,_),
        Visitantes),

    % A visitante que gosta do pintor Francês está ao lado de Sabrina.
    lado(visitante(_,_,_,frances,_,_),
         visitante(_,sabrina,_,_,_,_),
         Visitantes),

    % Quem gosta do pintor Espanhol está ao lado de quem chegou às 9:00.
    lado(visitante(_,_,_,espanhol,_,_),
         visitante(_,_,_,_,9,_),
         Visitantes),

    % A dona da bolsa Vermelha gosta do pintor Italiano.
    member(visitante(vermelha,_,_,italiano,_,_), Visitantes),

    % Quem chegou às 9:30 está entre quem foi de Trem e quem chegou às 9:00, nessa ordem.
    direita(visitante(_,_,_,_,9.5,_),
            visitante(_,_,_,_,_,trem),
            Visitantes),
    esquerda(visitante(_,_,_,_,9.5,_),
             visitante(_,_,_,_,9,_),
             Visitantes),

    % A visitante de bolsa Branca está ao lado da visitante que foi de Metrô.
    lado(visitante(branca,_,_,_,_,_),
         visitante(_,_,_,_,_,metro),
         Visitantes),

    bolsa(Bolsa1),
    bolsa(Bolsa2),
    bolsa(Bolsa3),
    bolsa(Bolsa4),
    bolsa(Bolsa5),
    distintos([Bolsa1,Bolsa2,Bolsa3,Bolsa4,Bolsa5]),

    nome(Nome1),
    nome(Nome2),
    nome(Nome3),
    nome(Nome4),
    nome(Nome5),
    distintos([Nome1,Nome2,Nome3,Nome4,Nome5]),

    idade(Idade1),
    idade(Idade2),
    idade(Idade3),
    idade(Idade4),
    idade(Idade5),
    distintos([Idade1,Idade2,Idade3,Idade4,Idade5]),

    pintor(Pintor1),
    pintor(Pintor2),
    pintor(Pintor3),
    pintor(Pintor4),
    pintor(Pintor5),
    distintos([Pintor1,Pintor2,Pintor3,Pintor4,Pintor5]),

    chegada(Chegada1),
    chegada(Chegada2),
    chegada(Chegada3),
    chegada(Chegada4),
    chegada(Chegada5),
    distintos([Chegada1,Chegada2,Chegada3,Chegada4,Chegada5]),

    transporte(Transporte1),
    transporte(Transporte2),
    transporte(Transporte3),
    transporte(Transporte4),
    transporte(Transporte5),
    distintos([Transporte1,Transporte2,Transporte3,Transporte4,Transporte5]).
