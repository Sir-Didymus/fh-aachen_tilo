
% Lade notwendige Prädikate
:- prolog_load_context(directory, Dir),
    directory_file_path(Dir, '../../praedikate/binbaum.pl', BinBaumPath),ensure_loaded(BinBaumPath).
:- prolog_load_context(directory, Dir),
    directory_file_path(Dir, '../../praedikate/add.pl', AddPath),ensure_loaded(AddPath).

% construct(Root,Lb,Rb,Xneub) : Xneub ist der Baum mit
    % - Wurzelbeschriftung Root, 
    % - linkem Teilbaum Lb und  
    % - rechtem Teilbaum Rb.  
construct(Root, Lb, Rb, n(Root, Lb, Rb)) :-
    binbaum(Lb), binbaum(Rb).

% knotenanz(Xb,N) : N ist die Anzahl der Knoten des Baumes Xb. 
knotenanz(e, o). % Leerer Baum hat 0 Knoten.
knotenanz(n(_X, Lb, Rb), s(N)) :-
    binbaum(Lb), binbaum(Rb), % Beide Kinder müssen gültige Binärbäume sein
    knotenanz(Lb, NL), % Knotenanz des linken Teilbaums
    knotenanz(Rb, NR), % Knotenanz des rechten Teilbaums
    add(NL, NR, N). % N Knotenanzahl beider Kindere
