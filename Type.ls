
  do ->

    is-string = (value) -> (typeof value) is 'string'

    is-object = (value) ->

      return no unless (typeof value) is 'object'

      switch value

        | void, null => no

        else yes

    is-function = (value) -> (typeof value) is 'function'

    is-array = (value) -> (typeof! value) is 'Array'

    is-number = (value) -> (typeof value) is 'number'

    is-boolean = (value) -> (typeof value) is 'boolean'

    {
      is-string, is-object, is-function, is-array, is-number, is-boolean
    }