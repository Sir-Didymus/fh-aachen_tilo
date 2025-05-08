% head(Xs,X) :- X ist das erste Element der Liste Xs.
head(list(X,Xs),X).

% tail(Xs,Ys :- Ys ist die Liste Xs ohne deren erstes Element.
tail(list(X,Xs),Xs).

% append(Xs,Ys,Rs) :- Liste Rs ergibt sicht durch Anhängen der Liste Ys an die Liste Xs.
app(nil,Ys,Ys).
app(list(X,Xs),Ys,list(X,Rs)) :- app(Xs,Ys,Rs).
