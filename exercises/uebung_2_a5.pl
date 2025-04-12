% vater(X,Y) : X ist Vater von Y.
vater(terach,abraham).
vater(terach,nachor).
vater(terach,haran).
vater(abraham,isaak).
vater(haran,lot). 
vater(haran,milcah).  
vater(haran,yiscah).

% mutter(X,Y) : X ist Mutter von Y.
mutter(sarah,isaak). 
  
% maennlich(X) : X ist männlich.
maennlich(terach).
maennlich(nachor). 
maennlich(abraham). 
maennlich(haran).
maennlich(isaak).
maennlich(lot). 
  
% weiblich(X) : X ist weiblich.
weiblich(sarah). 
weiblich(milcah). 
weiblich(yiscah). 

% grossvater(X,Y) : X ist Großvater von Y.
grossvater(X,Y) :- vater(X,Z),vater(Z,Y). 
grossvater(X,Y) :- vater(X,Z),mutter(Z,Y).

% elternteil(X,Y) : X ist Elternteil von Y.
elternteil(X,Y) :- vater(X,Y).
elternteil(X,Y) :- mutter(X,Y).

% sohn(X,Y) : X ist Sohn von Y.
sohn(X,Y) :- vater(Y,X), maennlich(X).
sohn(X,Y) :- mutter(Y,X), maennlich(X).

% tochter(X,Y) : X ist Tochter von Y.
tochter(X,Y) :- vater(Y,X), weiblich(X).
tochter(X,Y) :- mutter(Y,X), weiblich(X).
