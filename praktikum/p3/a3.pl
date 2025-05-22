% ==================================================================================================
% PRÄDIKATE AUS ÜBUNGEN

% app(Xs,Ys,Rs) : Die Liste Rs ergibt sich durch Anhängen der Liste Ys an die Liste Xs. 
app([],Ys,Ys). 
app([X|Xs],Ys,[X|Rs]) :- app(Xs,Ys,Rs).

% binbaum(X) : X ist ein binärer Baum.
binbaum(e). 
binbaum(n(_R,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

% ==================================================================================================

% praeorder(Xb,Ys) : Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Präorder.
praeorder(e,[]).
praeorder(n(R,Lb,Rb),[R|Ys]) :- praeorder(Lb,Ls), praeorder(Rb,Rs), append(Ls,Rs,Ys).

% postorder(Xb,Ys): Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Postorder. 
postorder(e,[]).
postorder(n(R,Lb,Rb), Ys) :- postorder(Lb,Ls), postorder(Rb,Rs), append(Ls,Rs,Hs), append(Hs,[R],Ys).

% roots(Xbs,Ys) : Xbs ist eine Liste von Binärbäumen (geschachtelte Induktion).
%                 Die Liste Ys ist die Liste der Wurzelbeschriftungen der Binärbäume in Xbs
%                 in der richtigen Reihenfolge.

roots([], []).
roots([e|Rests],Ys) :-roots(Rests,Ys).
roots([n(R,_Lb,_Rb)|Rests],[R|Ys]) :- roots(Rests,Ys).
