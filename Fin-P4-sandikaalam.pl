coefficient(N,A,B):- A1 is floor(N/2), B1 is floor(N/2), between(0,A1,A),between(0,B1,B), X is 2*A+5*B, N=:= X.

coins(N,C):- findall((A,B),coefficient(N,A,B),L), length(L,C).
