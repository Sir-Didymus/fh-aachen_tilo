invList([]). 
invList([0]).
invList1([Y,X|Xs]):- invList1([X|Xs]), Y is X+1.
