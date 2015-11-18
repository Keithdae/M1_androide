%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TME 3 - LRC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                      %
%     de Toldi Melchior, de Bézenac Emmanuel                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------------------------------ QUESTION 1 --------------------------------------%

concatene([], Y, Y).
concatene([A|X], Y, [A|Z]):-concatene(X,Y,Z).

% ------------------------------------ QUESTION 2 --------------------------------------%
inverse([],[]).
inverse([A|X], Y):-inverse(X, Z), concatene(Z, [A], Y).

% ------------------------------------ QUESTION 3 --------------------------------------%
supprime([], _, []).
supprime([A|X], Y, [A|Z]):-A\==Y, supprime(X, Y, Z).
supprime([_|X], Y, Z):-supprime(X, Y, Z).

% ------------------------------------ QUESTION 4 --------------------------------------%


filtre(_, [], _).
filtre(L1, [A|L2], L3):-supprime(L1, A, L3),filtre(L1, L2, L3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICE 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------------------------------ QUESTION 1 --------------------------------------%
palindrome([]).
palindrome([A|L]):-inverse(L, [B|_]), B==A.

% ------------------------------------ QUESTION 2 --------------------------------------%
% fonctions auxiliaires
dernier([X], X).
dernier([_|L],X):-dernier(L, X).

retirer_dernier([_], []).
retirer_dernier([A|L], [A|Z]):-retirer_dernier(L, Z).

%fonction principale
palindrome2([]).
palindrome2([_]).
palindrome2([A|L]):-dernier(L, A),retirer_dernier(L, Z), palindrome2(Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%