% binbaum(X) : X ist ein binärer Baum.
binbaum(e). 
binbaum(n(_R,Lb,Rb)) :- binbaum(Lb),binbaum(Rb).

% root(Xb,Y) : Y ist der Wurzeleintrag des Binärbaumes Xb.
root(n(X,Lb,Rb),X) :- binbaum(Lb), binbaum(Rb).

% left(Xb,Yb) : Yb ist der linke Teilbaum des Binärbaumes Xb. 
left(n(_X,Lb,Rb),Lb) :- binbaum(Lb), binbaum(Rb). 

% right(Xb,Yb) : Yb ist der rechte Teilbaum des Binärbaumes Xb.
right(n(_X,Lb,Rb),Rb) :- binbaum(Lb), binbaum(Rb). 
