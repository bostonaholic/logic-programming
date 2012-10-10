% http://okmij.org/ftp/kakuritu/logic-programming.html#daily-schedule

%
% Rules
%
day_before(X, Y, [X | [Y | _]]).
day_before(X, Y, [_ | Rest]) :- day_before(X, Y, Rest).

%
% Facts
%
weekly_schedule(Days) :-
    Days = [_Monday, _Tuesday, _Wednesday],
    member(daily_schedule(supermarket, shop), Days),
    member(daily_schedule(walk, barber), Days),
    % member(daily_schedule(barber, _), Days),
    % member(daily_schedule(supermarket, _), Days),
    % daily_schedule(supermarket, shop),
    % daily_schedule(walk, barber),
    day_before(daily_schedule(supermarket, _), daily_schedule(walk, _), Days),
    [_, daily_schedule(walk, _), _] = Days.

%
% Answer
%
% Days = [daily_schedule(supermarket, shop), daily_schedule(walk, barber), _].
