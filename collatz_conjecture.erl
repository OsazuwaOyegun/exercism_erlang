
-module(collatz_conjecture).

-export([steps/1]).


steps(N) -> steps(N, 0).

steps(N, _Count) when N=<0 -> error(badarg);

steps(1, Count) -> Count;
steps(N, Count) when N rem 2 == 0 -> steps(N div 2, Count+1);
steps(N, Count) when N rem 2 /= 0 -> steps(N*3+1, Count+1).
