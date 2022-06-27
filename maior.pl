maior(A,B,C,A) :- A >= B, A >= C.
maior(A,B,C,B) :- B >= A, B >= C.
maior(A,B,C,C) :- C >= A, C >= B.

/*
?- maior(3,9,6,X).
X = 9 .
?- maior(3,6,9,X).
X = 9.
?- maior(7,6,3,X).
X = 7 .
*/