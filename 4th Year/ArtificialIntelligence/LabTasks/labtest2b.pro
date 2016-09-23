sum([], 0).
sum([Head|Tail], Sum) :- sum(Tail, Tailsum), Sum is Head + Tailsum.