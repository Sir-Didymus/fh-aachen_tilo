% ==================================================================================================
% PRÄDIKATE AUS ÜBUNGEN

% binbaum(X) : X ist ein binärer Baum.
binbaum(e). 
binbaum(n(_R,Lb,Rb)) :- binbaum(Lb),binbaum(Rb).

% ==================================================================================================

% membertree(X,Xb) : Baum Xb enthält den Eintrag X. 
membertree(X,n(X,Lb,Rb)) :- binbaum(Rb), binbaum(Lb).
membertree(X,n(_R,Lb,Rb)) :- membertree(X,Lb).
membertree(X,n(_R,Lb,Rb)) :- membertree(X,Rb).
