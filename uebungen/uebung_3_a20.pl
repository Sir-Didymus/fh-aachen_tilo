% anz(Xs,N) : N (nat. Zahl in symbolischer Darstellung)
% ist die Anzahl der Einträge von Xs.
anz(nil,o).
anz(list(X,Rs),s(N)) :- anz(Rs,N).

% Not sure if this is right... Prof's solution uses append relation.
%
% praefix(Xs,Ys) : Ys beginnt mit der Liste Xs.
praefix(Rs,list(Y,Rs)).
