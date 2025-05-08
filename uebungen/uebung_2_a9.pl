kante(a,b).
kante(a,c).
kante(a,d).
kante(a,e).
kante(b,c).
kante(b,d).
kante(b,e).
kante(c,d).
kante(e,c).
kante(e,d).

% weg(X,Y) :- Es gibt einen gerichteten Weg von X nach Y.
weg(X,X).
weg(X,Y) :- kante(X,HZwischen),weg(HZwischen,Y).

% wegLaenge(X,Y,Laenge) :- Laenge ist Länge des Weges von X nach Y
wegLaenge(X,X,o).
wegLaenge(X,Y,s(Laenge)) :- kante(X,HZwischen), wegLaenge(Hzwischen,Y,Laenge).

