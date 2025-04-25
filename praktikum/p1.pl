% maennlich(X) : X ist männlich.
maennlich(bunn).
maennlich(boerr).
maennlich(boelthorn).
maennlich(vili).
maennlich(ve).
maennlich(odin).
maennlich(fjoergynn).
maennlich(balder).
maennlich(forseti).
maennlich(hoedr).
maennlich(hermodr).
maennlich(bragi).

% weiblich(X) : X ist weiblich.
weiblich(bestla).
weiblich(frigg).
weiblich(nanna).

% kind(X,Y) : X ist das Kind von Y.
kind(boerr,buri).
kind(bestla,boelthorn).
kind(bili,boerr).
kind(vili,bestla).
kind(ve,boerr).
kind(ve,bestla).
kind(odin,boerr).
kind(odin,bestla).
kind(frigg,fjoergynn).
kind(balder,odin).
kind(balder,frigg).
kind(forseti,balder).
kind(forseti,nanna).
kind(hoedr,odin).
kind(hoedr,frigg).
kind(hermodr,odin).
kind(hermodr,frigg).
kind(bragi,odin).
kind(bragi,frigg).

% vater(X,Y) : X ist Vater von Y.
vater(X,Y) :- kind(Y,X),maennlich(X).

% mutter(X,Y) : X ist Mutter von Y.
mutter(X,Y) :- kind(Y,X),weiblich(X).

% sohn(X,Y) : X ist Sohn von Y.
sohn(X,Y) :- kind(X,Y),maennlich(X).

% tochter(X,Y) : X ist Tochter von Y.
tochter(X,Y) :- kind(X,Y),weiblich(X).

% bruder(X,Y) : X ist Bruder von Y.
bruder(X,Y) :- maennlich(X),kind(X,Mutter),kind(X,Vater)
  ,kind(Y,Mutter),kind(Y,Vater), not(X=Y).

% schwester(X,Y) : X ist schwester von Y.
schwester(X,Y) :- weiblich(X),kind(X,Mutter),kind(X,Vater)
  ,kind(Y,Mutter),kind(Y,Vater), X \== Y.

% onkel(X,Y) :- X ist Onkel von Y.
onkel(X,Y) :- bruder(X,H),kind(Y,H).

% tante(X,Y) :- X ist Tante von Y.
tante(X,Y) :- schwester(X,H),kind(Y,H).

% cousin(X,Y) :- X ist Cousin von Y.
cousin(X,Y) :- maennlich(X),onkel(H,X),kind(Y,H).
cousin(X,Y) :- maennlich(X),tante(H,X),kind(Y,H).

% cousine(X,Y) :- X ist Cousin von Y.
cousine(X,Y) :- weiblich(X),onkel(H,X),kind(Y,H).
cousine(X,Y) :- weiblich(X),tante(H,X),kind(Y,H).

% grossvater(X,Y) :- X ist Großvater von Y.
grossvater(X,Y) :- vater(X,H),kind(Y,H).

% grossmutter(X,Y) :- X ist Großmutter von Y.
grossmutter(X,Y) :- mutter(X,H),kind(Y,H).
