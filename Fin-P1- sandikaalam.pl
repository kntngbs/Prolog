janken(A,B,'Adit',1):-
    (A = r, B = s);
    (A = s, B = p);
    (A = p, B = r).
janken(A,B,'Eko',-1):-
    (A = s, B = r);
    (A = p, B = s);
    (A = r, B = p).
janken(A,B,'Draw',0):-
    (A=B, B=r);
    (A=B, B=p);
    (A=B, B=s).


sum_win([],[],_,[]).
sum_win([H1|T1],[H2|T2],R,[R|T3]):- janken(H1,H2,_,R), sum_win(T1,T2,_,T3).
jankenlist(A,B,X):- sum_win(A,B,_,L), sumlist(L,H),((H=:=0, X = 'Draw'),!;(H>0, X = 'Adit'),!;(H<0, X = 'Eko'),!).




