% natList : Enthält Liste mit natürlichen Zahlen als Elementen
natList(nil).
natList(list(X,Xs)) :- natSymb(X), natList(Xs).

% invList : Enthält Liste der ersten n natürlichen Zahlen in umgekehrter Reihenfolge
invList(nil).
invList(list(o,nil)).
invList(list(s(X), list(X,Ys))) :- invList(list(X,Ys).)
