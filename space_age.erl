-module(space_age).

-export([age/2]).


age(earth, Seconds)  -> Seconds / 31557600;
age(mercury, Seconds)-> age(earth, Seconds) / 0.2408467;
age(venus, Seconds)  -> age(earth, Seconds) / 0.61519726;
age(mars, Seconds)   -> age(earth, Seconds) / 1.8808158;
age(jupiter, Seconds)-> age(earth, Seconds) / 11.862615;
age(saturn, Seconds) -> age(earth, Seconds) / 29.447498;
age(uranus, Seconds) -> age(earth, Seconds) / 84.016846;
age(neptune, Seconds)-> age(earth, Seconds) / 164.79132.

