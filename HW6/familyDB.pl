% family DB, with basic rules for parent, grandather, etc
% could be extended to include sister, cousin, uncle, etc

%grandfather(don,who).
father(don,ted).
father(don,barb).
father(don,paula).
father(greg,erin).
father(greg,austin).
father(wes,alyssa).
father(ted,jessica).
father(ted,david).
%mother(ted, john).

mother(audrey,ted).
mother(audrey,barb).
mother(audrey,paula).
mother(paula,erin).
mother(paula,austin).
mother(barb,alyssa).

married(don,audrey).
married(wes,barb).
married(greg,paula).

male(don).
male(ted).
male(wes).
male(greg).
male(austin).
male(david).

female(audrey).
female(barb).
female(paula).
female(alyssa).
female(jessica).
female(erin).

parent(X,Y) :-
	father(X,Y); mother(X,Y).

grandfather(X,Y) :-
	father(X,Z), parent(Z,Y).


samefather(X,Y) :-
	father(F,X),father(F,Y).

samemother(X,Y) :-
	mother(M,X),mother(M,Y).

child(X,Y)	:-
 parent(X,Y).

son(X,Y) :-
	male(X), parent(X,Y).

sibling(X,Y) :- not(parent(P,X)), parent(X,Y), not(X=Y).

sameparent(X,Y) :- samefather(X,Y).
sameparent(X,Y) :- samemother(X,Y), not(samefather(X,Y)).
%sameparent(X,Y) :- samemother(X,Y). %, not(samefather(X,Y)).

sameparents(X,Y)  :- samefather(X,Y), not(samemother(X,Y)); samemother(X,Y), not(samefather(X,Y)); samemother(X,Y), samefather(X,Y).

brother(X,Y) 	:- male(X), sameparent(X,Y), not(X=Y).

couple(X,Y)   :- married(X,Y).
couple(X,Y)   :- married(Y,X).

sister(X,Y) 	:- female(X), sameparent(X,Y), not(X=Y).
%sister(X,Y) 	:- female(X), father(Z, X), father(Z, Y), not(X=Y).
%sister(X,Y) 	:- female(X), mother(Z, X), mother(Z, Y), not(X=Y).
%sister(X,Y) 	:- female(X), father(Z, X), father(Z, Y); mother(Z, X), mother(Z, Y), not(X=Y).

%nephew(X,Y)   :- son(X,Y), brother(Y,X).
%nephew(X,Y)   :- son(X,Y), sister(Y,X), not(brother(Y,X)).
%nephew(X,Y)		 :- male(X), parent(X,Z), sister(Z,Y).
%nephew(X,Y)		:- male(X), parent(Z,X), brother(Z,Y); male(X), parent(Z,X), sister(Z,Y),  not(brother(Z,Y)).
%nephew(X,Y)   :- male(X), parent(Z,X), sister(Z,Y), not(brother(Z,Y)).
nephew(X,Y)		:- parent(X,Z), brother(Y,Z).
nephew(X,Y)		:- parent(X,Z), sister(Y,Z). %, not(brother(Y,Z)).


aunt(X,Y)			:- female(X), sister(X,Z), father(Z,Y).
aunt(X,Y)			:- female(X), sister(X,Z), mother(Z,Y), not(father(Z,Y)).
