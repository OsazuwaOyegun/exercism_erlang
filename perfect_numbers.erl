-module(perfect_numbers).

-export([classify/1]).


% classify(Number) -> classify(Number, lists:seq(1, Number-1), 0).

% classify(Number, [], Aliquot_Sum) when Aliquot_Sum == Number -> perfect;
% classify(Number, [], Aliquot_Sum) when Aliquot_Sum < Number -> deficient;
% classify(Number, [], Aliquot_Sum) when Aliquot_Sum > Number -> abundant;

% classify(Number, [H|T], Aliquot_Sum) when Number rem H == 0 -> classify(Number, T, Aliquot_Sum + H);
% classify(Number, [_H|T], Aliquot_Sum) -> classify(Number, T, Aliquot_Sum).

classify(Number) when Number>0 ->
    Aliquot_Sum = lists:sum([Num || Num <- lists:seq(1, Number-1), Number rem Num == 0]),
    if
        Aliquot_Sum == Number -> perfect;
        Aliquot_Sum < Number -> deficient;
        Aliquot_Sum > Number -> abundant
    end.

