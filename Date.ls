
  do ->

    date-as-tuples = (date) ->

      date

        * * ..get-full-year!
            ..get-month! + 1
            ..get-date!

          * ..get-hours!
            ..get-minutes!
            ..get-seconds!

    pad = (n) -> if n < 10 then "0#n" else String n

    tuple-as-string = (tuple, separator) -> tuple |> map-array-items _ , pad |> (* "#separator")

    tuples-as-string = ([ date-tuple, time-tuple ]) ->

      "#{ tuple-as-string date-tuple, '-' }T#{ tuple-as-string time-tuple, '_' }"

    get-timestamp = (date = new Date!) -> date |> date-as-tuples |> tuples-as-string

    {
      get-timestamp
    }