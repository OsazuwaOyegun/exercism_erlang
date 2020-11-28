-module(largest_series_product).

-export([largest_product/2]).

% Credit: hedgehog's solution @ https://exercism.io/tracks/erlang/exercises/largest-series-product/solutions/caa9132521ae43169516064a102c6ad1

largest_product(Digits, Span) ->
    List_of_spans = [string:slice(Digits, Start, Span) || Start <- lists:seq(0, length(Digits)-Span)],
    List_of_products = lists:map(fun(X)->calculate_product(X) end, List_of_spans),
    lists:max(List_of_products).

calculate_product(List) ->
    lists:foldl(fun(X, Prod)->erlang:list_to_integer([X])*Prod end, 1, List).

