% add(X,Y,X1) : X1 = X+Y
add(o,X,X) :- natSymb(X).
add(s(X),Y,s(H)) :- natSymb(X),natSymb(Y),natSymb(H),add(X,Y,H).

% mult(X,Y,X1) : X1 = X*Y
mult(o,X,o) :- natSymb(X).
mult(s(X),Y,H) :- mult(X,Y,Hilf),add(Hilf,Y,H),natSymb(X),natSymb(Y),natSymb(H).
