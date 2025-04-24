% eqZero(X) : X ist gleich 0.
eqZero(o).

% neqZero(X) : X ist ungleich 0.
neqZero(s(X)) :- natSymb(X).

% less(X,Y) : X ist kleiner als Y.
less(X,Y) :- natSymb(X), natSymb(Y), add(X,H,Y), neqZero(H).

% square(X,Y) : Y ist X².
square(X,Y) :- natSymb(X), natSymb(Y), mult(X,X,Y);
