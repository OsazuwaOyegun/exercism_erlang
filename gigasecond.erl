-module(gigasecond).

-export([from/1]).

from(From) -> 
    DateInGregorianSeconds = 
        case From of
            {Date, Time} = From ->
                calendar:datetime_to_gregorian_seconds({Date, Time});
            _ -> 
                calendar:datetime_to_gregorian_seconds({From, {0,0,0}})
        end,
    calendar:gregorian_seconds_to_datetime(DateInGregorianSeconds + 1000000000).

