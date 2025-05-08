% height(T,N) : N ist die Höhe des Baumes T. 
height(X,o) :- const(T).
height(X,o) :- variable(T).
height(tree(T1,T2),max(height(T1),height(T2))) :- Tree(T1), Tree(T2).

% functs(T,N) : N ist die Anzahl der  Funktoren des Baumes T.
%
% Keine Ahnung Kein Bock Ich will nicht mehr
