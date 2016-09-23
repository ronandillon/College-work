increment(X,Y) :- Y is X+1.
signum(X,Y):- X>0, Y is X-1 ; Y is 0. 
maxtwo(X,Y,Z) :- X>Y, Z is X; Z is Y. 
maxthree(X,Y,Z,W) :- maxtwo(X,Y,G),maxtwo(Z,G,K),W is K.
absolute(X,Y) :- (X>=0, Y is X ; Y is (X*(-1))).
fact(0,1).
fact(X,Y):- X>0, Z is X-1, fact(Z,W), Y is X*W.
fib(0,1).
fib(1,1).
fib(X,Y):- X>1, Z is X-1, fib(Z,W), K is X-2, fib(K,Q), Y is W+Q.
ack(0,Y,Z) :- Z is (Y+1).
ack(X,Y,Z) :- X>0, A is X-1,ack(A,1,Z).
ack(X,Y,Z) :- X>0,Y>0,A is Y-1, ack(X,A,B),C is X-1, ack(C,B,Z). 

ack2(0,Y,Z):-Z is Y+1.
ack2(X,0,Z):-X>0, W is X-1, ack(W,1,Z).
ack2(X,Y,Z):-X>0, Y>0, W is Y-1, ack(X,W,K), Q is X-1, ack(Q,K,Z).