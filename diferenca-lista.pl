diferenca(S1,[],S1) :- !.
diferenca([],_,[]) :- !.
diferenca(S1,[H,H1|T],S3) :- diferenca(S1,[H1|T],S4), diferenca(S4,[H],S3).
diferenca([X|T],[X],S3) :- diferenca(T,[X],S3).
diferenca([H|T],[X],[H|S3]) :- X \== H, diferenca(T,[X],S3).

/*
?- diferenca([1,2,3,4,5],[3,4],X).
X = [1, 2, 5] .
?- diferenca([1,2,3,4,5],[6,7],X).
X = [1, 2, 3, 4, 5] .
?- diferenca([1,2,3,4,5],[1,2,3,4,5],X).
X = [] .
*/