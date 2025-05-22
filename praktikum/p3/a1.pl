% ==================================================================================================
% PRÄDIKATE AUS ÜBUNGEN

% app(Xs,Ys,Rs) : Die Liste Rs ergibt sich durch Anhängen der Liste Ys an die Liste Xs. 
app([],Ys,Ys). 
app([X|Xs],Ys,[X|Rs]) :- app(Xs,Ys,Rs).

% präfix(Xs,Ys) : Ys beginnt mit der Liste Xs.
praefix(Xs,Ys) :- app(Xs,_Hs,Ys).

% ==================================================================================================

% postfix(Xs,Ys) : Ys endet mit der Liste Xs.
postfix_ohne_app(Xs,Ys) :- praefix(XRevs,YRevs), reverse(Xs,XRevs), reverse(Ys,YRevs).
postfix_mit_app(Xs,Ys) :- app(_Hs,Xs,Ys).

