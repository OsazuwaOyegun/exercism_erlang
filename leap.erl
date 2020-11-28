-module(leap).

-export([leap_year/1]).


leap_year(Year) when (Year rem 4 == 0) and ((Year rem 100 /= 0) or (Year rem 400 == 0)) -> true;
leap_year(_) -> false.
