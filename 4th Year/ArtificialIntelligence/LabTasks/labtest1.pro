bird(laysun_albatross).
bird(black_footed_albatross).
bird(trumpeter_swan).

colour(laysun_albatross,white).
colour(black_footed_albatross,dark).
colour(X,white) :- family(X,swan).

voice(trumpeter_swan,loud).

family(laysun_albatross,albatross).
family(black_footed_albatross,albatross).
family(trumpeter_swan,swan).

order(X,tubernose) :- family(X,albatross).
order(X,waterfowl) :- family(X,swan).

live(X,at_sea) :- family(X,albatross).

bill(X,hooked) :- family(X,albatross).

neck(X,long) :- family(X,swan).

flight(X,ponderous) :- family(X,swan).


