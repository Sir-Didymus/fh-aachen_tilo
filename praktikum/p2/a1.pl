% Lade notwendige Prädikate
:- prolog_load_context(directory, Dir),
   directory_file_path(Dir, '../../praedikate/append.pl', AppendPath),
   ensure_loaded(AppendPath).

% linListe(Xs) : Xs ist gültige Liste.
linListe(nil). % Leere Liste ist gültig.
linListe(list(X,Xs)) :- linListe(Xs). % Prädikat `list` ist gültig, wenn Arumente gültig sind.

% mem(X,Ys) : Ys enthält das Element X.
mem(X,list(X,Rests)) :- linListe(Rests).
mem(X,list(Y,Rests)) :- linListe(Rests), mem(X,Rests).

% infix(Xs,Ys) : Ys enthält die Liste Xs
infix(Xs,Xs) :- linListe(Xs). % Jede Liste enthält sich selbst.
infix(Xs,Ys) :- app(Hs,Xs,Ys). % Ys ergiebt sich durch anhängen von Xs an Anfagnsliste.
infix(Xs,Ys) :- app(Xs,Hs,Ys). % Ys ergiebt sich druch anhängen von Endliste an Xs.

% attach(Xs,X,Ys) : Ys ist Xs verlängert um das Element X.
attach(Xs,X,Ys) :- linListe(Xs), linListe(Ys), app(Xs,list(X,nil),Ys).

% rev(Xs,Ys) : Ys ist das gespiegelte Xs. 
rev(nil,nil).
rev(list(X,Xs),Ys) :- rev(Xs,Hs), app(Hs,list(X,nil),Ys).
