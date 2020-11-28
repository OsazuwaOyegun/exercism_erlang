-module(nth_prime).

-export([prime/1]).

prime(0) -> error("_");
prime(N) -> prime(N, 1, 0).

prime(0, _Num, Result) -> Result;
prime(N, Num, Result) -> 
    case N=:=0 of
        true -> prime(0, Num, Result);
        false -> case is_prime(Num) of
                    true -> prime(N-1, Num+1, Num);
                    false -> prime(N, Num+1, Result)
                end
    end.

is_prime(1) -> false;
is_prime(2) -> true;
is_prime(N) -> lists:all(fun(X)-> N rem X =/=0 end, lists:seq(2, ceil(math:sqrt(N)))).

% To test n for primality (to see if it is prime) just divide by all of the primes less than the square root of n. 
% For example, to show is 211 is prime, we just divide by 2, 3, 5, 7, 11, and 13.

