palindromo([]).
palindromo([_]).
palindromo([H1,H2|T]) :- igualUltimo(H1,[H2|T]), removeUltimo([H2|T],L), palindromo(L).

igualUltimo(X, [X]).
igualUltimo(X, [_,H2|T]) :- igualUltimo(X,[H2|T]).

removeUltimo([_], []).
removeUltimo([],[]).
removeUltimo([H1,H2|T], [H1|L]) :- removeUltimo([H2|T],L).

/*
?- palindromo([1,2,3,4]).
false.
?- palindromo([1,2,3,4,3,2,1]).
true .
?- palindromo([1,2,3,4,4,3,2,1]).
true .
?- palindromo([1,2,3,4,3,3,2,1]).
false.
*/