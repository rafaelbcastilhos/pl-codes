triangulo(X, Y, Z) :-
    X < Y + Z,
    Y < X + Z,
    Z < X + Y,
    X > abs(Y - Z),
    Y > abs(X - Z),
    Z > abs(X - Y).

# triangulo(4,8,9).
# triangulo(10,5,4).
