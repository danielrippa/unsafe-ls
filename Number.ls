
  do ->

    is-number = (value) -> (typeof value) is 'number'

    is-nan = (value) ->

      return no unless is-number value

      value isnt value

    is-infinity = (value) ->

      return no unless is-number value

      switch value

        | Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY => yes

        else no

    is-number-string = (value) -> value |> Number |> is-nan |> (not)

    {
      is-number,
      is-nan,
      is-infinity,
      is-number-string
    }