:- write('Running...'), nl.

% Family Database

child(john, sue).
child(john, sam).
child(sue, george).
child(jane, sam).
child(jane, sue).
child(sue, gina).

male(john).
male(sam).
male(george).
female(sue).
female(jane).
female(june).

parent(Y, X):- child(X, Y).
father(Y, X):- child(X, Y), male(Y).
oppsex(X, Y):- male(X), female(Y).
oppsex(Y, X):- male(X), female(Y).
grand_father(X, Z) :- father(X, Y), parent(Y,Z).

?- male(john).
:- halt.