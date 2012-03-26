%
% facts
%
cat(garfield).
eats(garfield, lasagna).
owner(garfield, jon).

%
% rules
%
animal(X) :- cat(X).
