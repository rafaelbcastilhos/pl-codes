xor(X,Y) :- (X ; Y) , not((X , Y)).

/*
?- xor(false, false).
false.
?- xor(false, true).
true.
?- xor(true, false).
true .
?- xor(true, true).
false
*/