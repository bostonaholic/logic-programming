%
% use_module(library(clpfd)).
%
simple(Q) :-
    Q = [X, Y],
    4*X + 2*Y #= 24,
    X + Y #= 9,
    [X,Y] ins 0..9.
