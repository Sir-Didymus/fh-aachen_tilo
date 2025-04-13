% natSymb(X): X ist natürliche Zahl in symbolischer Darstellung
natSymb(o).
natSymb(s(X)) :- natSymb(X).
