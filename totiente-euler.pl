mdc(1,_,1) :- !.
mdc(_,1,1) :- !.
mdc(X,X,X) :- !.
mdc(X,Y,Resultado) :- X > 1, Y > 1, X \== Y, Resultado is mod(X, Y), mod(Y,Resultado) =:= 0, !.
mdc(X,Y,Resultado) :- X > 1, Y > 1, X \== Y, R is mod(X, Y), mdc(Y,R,Resultado), !.

coprimos(X,Y) :- mdc(X,Y,1).

totienteEuler(N,K) :- N1 is N - 1, totienteEulerR(N,N1,K).

totienteEulerR(_,N,0) :- N < 1.
totienteEulerR(NO,N,K) :- N >= 1, coprimos(NO,N), N1 is N - 1, totienteEulerR(NO,N1,K1), K is 1 + K1.
totienteEulerR(NO,N,K) :- N >= 1, not(coprimos(NO,N)), N1 is N - 1, totienteEulerR(NO,N1,K).

/*
?- totienteEuler(3,X).
X = 2 .
?- totienteEuler(4,X).
X = 2 .
?- totienteEuler(7,X).
X = 6 .
?- totienteEuler(10,X).
X = 4 .
*/