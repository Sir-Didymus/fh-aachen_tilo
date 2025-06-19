
% ====================================
% AUFGABE A)
%
% PDA MPalin-Bin aus Skript Seite 102
% ====================================

% zustand(X) : X ist Zustand des PDA.
zustand(z).

% sigma(A) : A ist Teil des Alphabets Sigma.
sigma(0).
sigma(1).

% gamma(A) : A ist Teil des Kelleralphabets Gamma.
gamma(0).
gamma(1).
gamma(s).

% Transitionsrelatiion
%
% delta(Z_akt, Eingabe, Stack_spitze, Z_neu, Keller_neu) : 
% Von der Eingabekonfiguration (Z_akt, Eingabe, Stack_spitze)
% gelangt man zu (Z_neu, Keller_neu).

delta(z,0,0,z,[]).
delta(z,1,1,z,[]).

delta(z,nix,s,z,[]).
delta(z,nix,s,z,[0]).
delta(z,nix,s,z,[1]).
delta(z,nix,s,z,[0,s,0]).
delta(z,nix,s,z,[1,s,1]).

% start(X) : X ist der Startzustand des PDA.
start(z).

% kellerbodensymbol(X) : X ist das kellerbodensymbol des PDA.
kellerbodensymbol(s).

% ==============================
% AUFGABE B)
% ==============================

% ======
% Sigma*
% ======

% Das leere Wort ist in Sigma Stern
sigma_stern([]).

% Laufe Wort Zeichen für Zeichen entlang und überprüfe, dass alle Zeichen in Sigma sind.
sigma_stern([A|Ws]) :- sigma(A), sigma_stern(Ws). 

% =====================
% Einzelschrittrelation
% =====================

% Terminalsymbol auf Stackspitze
es(State_akt, [A|W_rs], [S|Stack], State_neu, W_rs, Stack_neu) :-
    delta(State_akt, A, S, State_neu, Stack_push),
    append(Stack_push, Stack, Stack_neu). % Schreibe Symbole aus 'Stack_push' auf den Stack.

% Variable auf Stackspitze
es(State_akt, W, [S|Stack], State_neu, W, Stack_neu) :-
    delta(State_akt, nix, S, State_neu, Stack_push),
    append(Stack_push, Stack, Stack_neu). % Schreibe Symbole aus 'Stack_push' auf den Stack.

% ==============================================
% Tansitiver Abschluss von Einzelschrittrelation
% ==============================================

es_plus(State_akt, W_akt, Stack_akt, State_neu, W_neu, Stack_neu) :-
    es(State_akt, W_akt, Stack_akt, State_neu, W_neu, Stack_neu). % Einzelschrittrelation existiert für diese Konfiguration.

es_plus(State_akt, W_akt, Stack_akt, State_neu, W_neu, Stack_neu) :-
    es(State_akt, W_akt, Stack_akt, State_zwischen, W_zwischen, Stack_zwischen), % Gehe einen Schritt weiter, zu einer Zwischenkonfiguration.
    es_plus(State_zwischen, W_zwischen, Stack_zwischen, State_neu, W_neu, Stack_neu). % Gelange mittles es_plus von Zwischenkonfiguration in Endzustand

% ================================
% Die von dem PDA erkannte Sprache
% ================================

lvonM(Ws) :- sigma_stern(Ws), % Wort muss in Sigma* sein.
             start(Start), % Überprüfe, dass Anfangszustand gültiger Startzustand ist.
             kellerbodensymbol(K), % Überprüfe, dass Anfnagssymbol im Stack kellerbodensymbol ist.
             es_plus(Start, Ws, [K], _State_neu, [], []). % Leerer Stack und leere Eingabe -> Wort ist in Sprache.
