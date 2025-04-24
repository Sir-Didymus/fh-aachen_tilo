% expo(X,Y,R) : R = X hoch Y.
% Dieses Mal 2. Argument als Induktionsargument
expo(X,o,s(o)) :- X.
exp(X,s(Y),R) :- exp(X,Y,H),mult(H,X,R).
