% ==============================
% AUFGABE A)
%
% NEA End010 aus Skript Seite 90
% ==============================

% zustand(X) : X ist Zustand des NEA.
zustand(z0).
zustand(z1).
zustand(z2).
zustand(z3).

% sigma(A) : A ist Teil des Alphabets Sigma.
sigma(0).
sigma(1).

% Transitionsrelatiion
% delta(Zakt,A,Zneu) : Von Zakt gelangt man mit Eingabe A zu Zneu.
delta(z0,0,z0).
delta(z0,0,z1).
delta(z0,1,z0).
delta(z1,1,z2).
delta(z2,0,z3).

% start(X) : X ist Startzustandsmenge des NEA.
start(z0).

% end(X) : X ist Endzustandsmenge des NEA.
end(z3).

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

% ======
% Delta*
% ======

% Ich benutze hier S (wie in "state") statt Z, da Z für Quieries vorbehalten ist.

% delta_stern(Sakt,Ws,Sneu) :- Man kommt von Sakt und dem Wort Ws über
%                              den transitiven Abschluss delta_stern nach Sneu.
delta_stern(Sakt,[],Sakt).
delta_stern(Sakt,[A|Wrs],Sneu) :- delta(Sakt,A,Sh), delta_stern(Sh,Wrs,Sneu).

% =====
% 1vonN
% =====

% 1vonN(Ws) :- Das Wort Ws ist in der Sprache, die von NEA erzeugt wird, enthalten.
einsVonN(Ws) :- sigma_stern(Ws), start(Start), delta_stern(Start,Ws,End),
             end(End). % end(End) muss ans Ende kommen, damit beliebige Endzustände erreicht werden können.
