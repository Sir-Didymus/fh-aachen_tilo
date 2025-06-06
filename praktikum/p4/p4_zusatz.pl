
% ==============================
%  Zusatzaufgabe
% ==============================

% zustand(X) : X ist Zustand des NEA.
zustand(state_S).
zustand(state_A).
zustand(state_B).
zustand(state_C).

% sigma(A) : A ist Teil des Alphabets Sigma.
sigma(a).
sigma(b).

% Transitionsrelatiion
% delta(Zakt,A,Zneu) : Von Zakt gelangt man mit Eingabe A zu Zneu.
delta(state_S,a,state_A).
delta(state_S,a,state_S).
delta(state_S,b,state_S).
delta(state_A,b,state_B).
delta(state_B,b,state_B).
delta(state_B,a,state_C).
delta(state_C,b,state_C).

% start(X) : X ist EIN Startzustand des NEA.
start(state_S).

% end(X) : X ist EIN Endzustand des NEA.
end(state_C).

% ==============================
% AUFGABE B)
% ==============================

% ======
% Sigma*
% ======

% Das leere Wort ist in Sigma Stern
sigma_stern([]).

% Laufe Wort Zeichen für Zeichen entlang und überprüfe, dass alle Zeichen in Sigma sind
sigma_stern([A|Ws]) :- sigma(A), sigma_stern(Ws). 

% =====
% Delta
% =====

% Ich benutze hier S (wie in "state") statt Z, da Z für Quieries vorbehalten ist.

% delta_stern(Sakt,Ws,Sneu) :- Man kommt von Sakt und dem Wort Ws über
%                              den transitiven Abschluss delta_stern nach Sneu.
delta_stern(Sakt,[],Sakt).
delta_stern(Sakt,[A|Wrs],Sneu) :- delta_stern(Sh,Wrs,Sneu), delta(Sakt,A,Sh).

% =====
% 1vonN
% =====

% 1vonN(Ws) :- Das Wort Ws ist in der Sprache, die von NEA erzeugt wird, enthalten.
einsVonN(Ws) :-
             start(Start),
             end(End), % end(End) muss ans Ende kommen, damit beliebige Endzustände erreicht werden können.
             delta_stern(Start,Ws,End),
             sigma_stern(Ws).
