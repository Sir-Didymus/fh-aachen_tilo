% app(Xs,Ys,Rs) : Die Liste Rs ergibt sich durch Anhängen der Liste Ys an die Liste Xs. 
app(nil,Ys,Ys). 
app(list(X,Xs),Ys,list(X,Rs)) :- app(Xs,Ys,Rs).
