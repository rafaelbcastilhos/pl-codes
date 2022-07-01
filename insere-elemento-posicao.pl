inserirElementoPosicao(X,_,[],[X]) :- !.
inserirElementoPosicao(X,0,L1,[X|L1]) :- !.
inserirElementoPosicao(X,P,[H|T],[H|L2]) :- P1 is P - 1, inserirElementoPosicao(X,P1,T,L2), !.

/*
?- inserirElementoPosicao(0,1,[2,2,2],X).
X = [2, 0, 2, 2].
?- inserirElementoPosicao(1,0,[2,2,2],X).
X = [1, 2, 2, 2].
?- inserirElementoPosicao(1,1,[2,2,2],X).
X = [2, 1, 2, 2].
?- inserirElementoPosicao(1,2,[2,2,2],X).
X = [2, 2, 1, 2].
?- inserirElementoPosicao(1,3,[2,2,2],X).
X = [2, 2, 2, 1].
*/