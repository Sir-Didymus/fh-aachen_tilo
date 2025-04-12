% natSymb(X): X ist natürliche Zahl in symbolischer Darstellung
natSymb(o).
natSymb(S(X)) :- natSymb(X).
