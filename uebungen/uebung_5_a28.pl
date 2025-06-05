% select(X,Xs,Ys): Die Listen Ys ergeben sich aus der Liste Xs
%                  durch einmaliges Entfernen von X an beliebiger Stelle.
select(X,[X|Xs],Xs). % 1. Element raus, falls X 
% X aus Restliste an beliebiger Stelle entfernen, 1. Element stehen lassen.    
select(X,[Y|Ys],[Y|Rs]) :- select(X,Ys,Rs).   

% insert(X,Xs,Ys): Die Listen Ys ergeben sich aus der Liste Xs
%                  durch einmaliges Einfügen von X an beliebiger Stelle.
insert(X,Ys,Rs) :- select(X,Rs,Ys). % Vertauschung 2.& 3. Argument 
 
% Ein bel. Y aus Xs rausnehmen, Rest permutieren und Y davorsetzen 
permutation1([],[]). 
permutation1(Xs,[Y|X1s]) :- select(Y,Xs,Ys), permutation1(Ys,X1s). 
 
% Xs ohne 1. Element X permutieren und X irgendwo in die Permutation einfügen.  
permutation2([],[]). 
permutation2([X|Xs],X1s) :- permutation2(Xs,Ys), insert(X,Ys,X1s). 
