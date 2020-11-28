-module(triangle).

-export([kind/3]).


kind(A, B, C) when ((A+B)<C) or ((A+C)<B) or ((B+C)<A)      -> {error, "side lengths violate triangle inequality"};
kind(A, B, C) when A=<0;B=<0;C=<0                           -> {error, "all side lengths must be positive"};
kind(A, A, A)                                               -> equilateral;
kind(A, B, C) when A/=B,B/=C,A/=C                           -> scalene;
kind(A, B, C) when A==B;B==C;A==C                           -> isosceles.

