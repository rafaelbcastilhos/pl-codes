aprovado(A,B,C) :- media(A,B,C,M), M >= 6.
media(A,B,C,M) :- M is (A + B + C) / 3.

/*
?- aprovado(6,6,6).
true.
?- aprovado(6,6,5.9).
false.
?- aprovado(7,7,7).
true.
?- aprovado(3,6,9).
true.
?- aprovado(3,6,8).
false.