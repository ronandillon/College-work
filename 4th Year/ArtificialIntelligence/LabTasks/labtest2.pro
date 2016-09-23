element_at(X,[X|_],1).
element_at(X,[_|Tail],K) :- K > 1, K1 is K - 1, element_at(X,Tail,K1).

sum([], 0).
sum([Head|Tail], Sum) :- sum(Tail, Tailsum), Sum is Head + Tailsum.

