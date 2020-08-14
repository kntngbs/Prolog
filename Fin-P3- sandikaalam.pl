
panjang(L):- between(8,12,L).

up([H|_]):- between(65,90,H),!.
up([_|T]):- up(T).

low([H|_]):- between(97,122,H),!.
low([_|T]):- low(T).

num([H|_]):- between(48,57,H),!.
num([_|T]):- num(T).

spes1(33):-!.
spes1(64):-!.
spes1(36):-!.
spes1(42):-!.
spes1(123):-!.
spes1(125):-!.
spes1(44):-!.
spes1(46):-!.
spes1(34):-!.
spes1(58):-!.

spes([H|_]):- spes1(H),!.
spes([_|T]):- spes(T).

strong(Username,Password):-
    name(Username,ListName),
    name(Password,ListPass),
    length(ListPass,LengthPass),
    panjang(LengthPass),
    up(ListPass),
    low(ListPass),
    num(ListPass),
    not(sub_list(ListName,ListPass)),
    spes(ListPass),
    not(nonchar(ListPass)).

nonchar([H|_]):- not(between(65,90,H)), not(between(97,122,H)),not(between(48,57,H)), not(spes1(H)),!.
nonchar([_|T]):- nonchar(T).


suffix1(S,L):- append(_,S,L).
prefix1(P,L):- append(P,_,L).
sub_list(M,L):- suffix1(S,L), prefix1(M,S).
