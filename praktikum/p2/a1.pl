% Lade notwendige Prädikate
:- prolog_load_context(directory, Dir),
   directory_file_path(Dir, '../../praedikate/append.pl', AppendPath),
   ensure_loaded(AppendPath).

% linListe(Xs) : Xs ist gültige Liste.
linListe(nil). % Leere Liste ist gültig.
linListe(list(_X,Xs)) :- linListe(Xs). % Prädikat `list` ist gültig, wenn Arumente gültig sind.

% mem(X,Ys) : Ys enthält das Element X.
mem(X,list(X,Rests)) :- linListe(Rests).
mem(X,list(_Y,Rests)) :- linListe(Rests), mem(X,Rests).

% infix(Xs,Ys) : Ys enthält die Liste Xs
infix(Xs,Ys) :-
    linListe(Xs), linListe(Ys),
    app(_Prefix,Suffix,Ys), % Teile Ys in zwei Teile. Können nichtdeterm. beliebige Längen <= der Länge von Ys haben.
    app(Xs,_Rests,Suffix). % Wenn Xs im Suffix vorkommt, dann ist es auch in Ys enthalten

% attach(Xs,X,Ys) : Ys ist Xs verlängert um das Element X.
attach(Xs,X,Ys) :-
    app(Xs,list(X,nil),Ys),
    linListe(Xs), linListe(Ys).

% rev(Xs,Ys) : Ys ist das gespiegelte Xs. 
rev(nil,nil).
rev(list(X,Xs),Ys) :- rev(Xs,Hs), app(Hs,list(X,nil),Ys).
