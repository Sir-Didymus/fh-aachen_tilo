% wegstrecke(X,Y,Knotens) : Die Liste Knotens enthält die Knoten auf dem gefundenen Weg zwischen X und Y in der richtigen Reihenfolge.
wegstrecke(X,X,nil).
wegstrecke(X,Y,list(X,Rs)) :- kante(X,HZwischen), wegstrecke(HZwischen,Y,Rs).
