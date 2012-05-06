%
% facts
%
cat(garfield).
dog(odie).
eats(garfield, lasagna).
eats(odie, dog_food).
owner(garfield, jon).

%
% rules
%
animal(X) :- cat(X).
animal(X) :- dog(X).
