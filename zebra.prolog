%
% Rules
%
is_right(L, R, [L | [R | _]]).
is_right(L, R, [_ | Rest]) :- is_right(L, R, Rest).

next_to(X, Y, List) :- is_right(X, Y, List).
next_to(X, Y, List) :- is_right(Y, X, List).

%
% Facts
%
% house(Color, Nationality, Pet, Drink, Smoke).
owns_zebra(Street, Who) :-
    Street = [_House1, _House2, _House3, _House4, _House5],
    member(house(red, englishman, _, _, _), Street),
    member(house(_, spaniard, dog, _, _), Street),
    member(house(green, _, _, coffee, _), Street),
    member(house(_, ukrainian, _, tea, _), Street),
    is_right(house(green, _, _, _, _), house(ivory, _, _, _, _), Street),
    member(house(_, _, snails, _, old_gold), Street),
    member(house(yellow, _, _, _, kools), Street),
    [_, _, house(_, _, _, milk, _), _, _] = Street,
    [house(_, norwegian, _, _, _) | _] = Street,
    next_to(house(_, _, _, _, chesterfields), house(_, _, fox, _, _), Street),
    next_to(house(_, _, _, _, kools), house(_, _, horse, _, _), Street),
    member(house(_, _, _, orange_juice, lucky_strike), Street),
    member(house(_, japanese, _, _, parliaments), Street),
    next_to(house(_, norwegian, _, _, _), house(blue, _, _, _, _), Street),
    member(house(_, Who, zebra, _, _), Street).
