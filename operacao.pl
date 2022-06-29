operacao(+,X,Y,Resultado) :- Resultado is X + Y.
operacao(-,X,Y,Resultado) :- Resultado is X - Y.
operacao(*,X,Y,Resultado) :- Resultado is X * Y.
operacao(/,X,Y,Resultado) :- Resultado is X / Y.

/*
?- operacao(+,2,3,X).
X = 5.
?- operacao(-,2,3,X).
X = -1.
?- operacao(*,2,3,X).
X = 6.
?- operacao(/,2,3,X).
X = 0.6666666666666666.
*/