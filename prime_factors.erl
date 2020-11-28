-module(prime_factors).

-export([factors/1]).


factors(Value) -> factors(Value, 2, []).

factors(1, _Factor, Result) -> lists:sort(Result);

factors(Value, Factor, Result) when (Value rem Factor) == 0 -> factors(Value div Factor, Factor, [Factor | Result]);
factors(Value, Factor, Result) when (Value rem Factor) /=0 -> factors(Value, Factor+1, Result).

