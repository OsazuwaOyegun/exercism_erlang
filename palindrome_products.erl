-module(palindrome_products).

-export([smallest/2, largest/2]).

smallest(Min, Max) -> work(smallest, Min, Max).
largest(Min, Max) -> work(largest, Min, Max).

work(_, X, X) -> undefined;
work(_, Min, Max) when Min >=Max -> error("Min cannot be greater than Max");
work(Function, Min, Max) ->
    Step = get_step(Min, Max),
    List_of_palindromes = get_list(Function, Min, Max, Step),
    work2(Function, List_of_palindromes, []).   % iterate over list of palindrome & factor tuples returned by function get_list

work2(_Function, [], []) -> undefined;   % List of palindromes is empty - no palindromes in given range i.e. get_list(Min, Max)==[]
work2(_Function, [], Result) -> Result;
work2(Function, [H|T], []) -> work2(Function, T, {element(1, H), element(2, H)});
% When palindrome has multiple factors, capture each pair of factors in the list of tuple factors e.g. for palindrome 9, {9, [{1,9}, {3,3}]}
work2(Function, [H|T], Result) when element(1, H)=:=element(1, Result) -> work2(Function, T, {element(1, Result), [hd(element(2, Result)), hd(element(2, H))]});

work2(smallest, [H|T], Result) when element(1, H)<element(1, Result) -> work2(smallest, T, {element(1, H), element(2, H)});
work2(largest, [H|T], Result) when element(1, H)>element(1, Result) -> work2(largest, T, {element(1, H), element(2, H)});

work2(Function, [_H|T], Result) -> work2(Function, T, Result).

get_step(Min, Max) ->
    if 
        Max - Min < 10 -> Max - Min;
        true -> 100     % Avoiding timeout errors
    end.

% return list of tuples of palindrome and factors - e.g. for range 1-9 list returned is  [{1,[{1,1}]},{2,[{1,2}]}...{9,[{1,9}]}....{9,[{3,3}]}]
get_list(Function, Min, Max, Step) ->
    case Function=:=smallest of
            true -> [{X*Y, [{X, Y}]} || X<-lists:seq(Min, Min+Step), Y<-lists:seq(Min, Min+Step), X=<Y, X>0, is_palindrome(X,Y)];
            _ -> [{X*Y, [{X, Y}]} || X<-lists:seq(Max-Step, Max), Y<-lists:seq(Max-Step, Max), X=<Y, X>0, is_palindrome(X,Y)]
        end.

is_palindrome(X, Y) -> 
    Product = X*Y,
    Product-erlang:list_to_integer(lists:reverse(erlang:integer_to_list(Product))) =:= 0.

