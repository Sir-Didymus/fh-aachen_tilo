% add(X,Y,R) : X + Y = R
add(o,X,X). 
add(s(X),Y,s(R)) :- add(X,Y,R).
