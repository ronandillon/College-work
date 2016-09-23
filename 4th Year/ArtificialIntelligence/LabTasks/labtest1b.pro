bird(laysun_albatross).
bird(black_footed_albatross).
bird(trumpeter_swan).

family(laysun_albatross,albatross).
family(black_footed_albatross,albatross).
family(trumpeter_swan,swan).

family(X,swan). :- colour(X,white),order(X,waterfowl),neck(X,long).