listlength([],0).
listlength([_X|Xs],Nplus) :- listlength(Xs,N), Nplus is N+1.

anz(X,[],0).
anz(X,[X|Xs],Nplus) :- anz(X,Xs,N), Nplus is N+1.
anz(X,[Y,Ys],N) :- X \== Y, anz(X,Ys,N).
