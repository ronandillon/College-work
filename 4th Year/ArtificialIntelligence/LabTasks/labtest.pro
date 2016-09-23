taller(Bob,Mike).
taller(Mike,Jim).
taller(Jim,George).

is_taller(X,Y) :- taller(X,Y).
is_taller(X,Y) :- taller(X,Z) , is_taller(Z,Y).