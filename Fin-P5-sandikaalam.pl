edge(a,b,10). edge(b,c,20). edge(c,d,30). edge(d,e,40).
edge(a,f,15). edge(b,g,20). edge(c,h,25). edge(d,i,30). edge(e,j,35).
edge(j,i,5). edge(i,h,15). edge(h,g,25). edge(g,f,35).
edge(f,k,25). edge(g,l,20). edge(h,m,15). edge(i,n,10). edge(j,o,5).
edge(k,l,40). edge(l,m,20). edge(m,n,10). edge(n,o,5).
edge(k,p,5). edge(l,q,10). edge(m,r,15). edge(n,s,20). edge(o,t,25).
edge(t,s,35). edge(s,r,25). edge(r,q,15). edge(q,p,5).

adjacent(A,B,[A,B],Weight):- edge(A,B,Weight).

% path/4 predicate, base case
path(A,B,[A,B],Weight):- adjacent(A,B,[A,B],Weight).
% path/4 predicate, recursive case
path(A,B,[A|Rest],Length):-
adjacent(A,X,[A,X],WeightAX), % A and X are adjacent.
path(X,B,Rest,LengthXB), % there is a path between X and B.
Length is WeightAX + LengthXB .


memberlist([],_,0).
memberlist([H|T],L,X) :-  memberlist(T,L,Y),
    (member(H, L) -> X is Y + 1; X is Y + 0).

check(L1,L2) :- memberlist(L1,L2,A), A == 0.

path_transit(X,Y,Path,Trans,L):- path(X,Y,Path,L),subset(Trans,Path).

path_avoid(A,B,Path,Avoid,L) :-
    path(A,B,Path,L),
    check(Avoid,Path).








