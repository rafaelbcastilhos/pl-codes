primeiros(0,[_|_],[]) :- !.
primeiros(_,[],[]) :- !.
primeiros(N,[H|T],[H|L]) :- N > 0, N2 is N - 1, primeiros(N2, T, L).

/*
?- primeiros(3,[1,2,3,4,5],X).
X = [1, 2, 3].
?- primeiros(4,[1,2,3,4,5],X).
X = [1, 2, 3, 4].
*/