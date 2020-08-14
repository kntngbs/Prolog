
attack((X,Y),(X1,Y1)):- X>2, Y<8, X1 is X-2, Y1 is Y+1. %kiri bawah
attack((X,Y),(X1,Y1)):- X>2, Y>1, X1 is X-2, Y1 is Y-1. %kiri atas
attack((X,Y),(X1,Y1)):- X>1, Y>2, X1 is X-1, Y1 is Y-2. %atas kiri
attack((X,Y),(X1,Y1)):- X<8, Y>2, X1 is X+1, Y1 is Y-2. %atas kanan
attack((X,Y),(X1,Y1)):- X<7, Y>1, X1 is X+2, Y1 is Y-1. %kanan atas
attack((X,Y),(X1,Y1)):- X<7, Y<8, X1 is X+2, Y1 is Y+1. %kanan bawah
attack((X,Y),(X1,Y1)):- X<8, Y<7, X1 is X+1, Y1 is Y+2. %bawah kanan
attack((X,Y),(X1,Y1)):- X>1, Y<7, X1 is X-1, Y1 is Y+2. %bawah kiri


unsafe((X,Y),(X,Y)).
unsafe((X1,Y1),(X2,Y2)):- attack((X1,Y1),(X2,Y2)).

safe((X1,Y1),(X2,Y2)):-
    between(1,8,X1),between(1,8,Y1),
    between(1,8,X2),between(1,8,Y2),
    not(unsafe((X1,Y1),(X2,Y2))).

safe([K],Position):- safe(K,Position).
safe([K | OtherK],Position):- safe(K,Position),safe(OtherK,Position),!.
