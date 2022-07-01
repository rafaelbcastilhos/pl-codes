posicao(X,[X|_],0).
posicao(X,[_|T],P) :- posicao(X,T,P1), P is P1 + 1

/*.
?- posicao(2,[1,2,3,4,5],X).
X = 1 .
?- posicao(6,[1,2,3,4,5],X).
false.
?- posicao(3,[1,2,3,4,5],X).
X = 2 .
?- posicao(3,[3,2,3,4,5],X).
X = 0 .
?- posicao(3,[3,2,3,4,5],X).
X = 0 ;
X = 2 ;
false.
*/