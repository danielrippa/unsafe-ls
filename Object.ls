
  do ->

    is-object = (value) ->

      return no unless (typeof value) is 'object'

      switch value

        | void, null => no

        else yes

    object-member-names = (object) -> [ (member-name) for member-name of object ]

    object-member-pairs = (object) -> [ [ name, value ] for name, value of object ]

    object-from-keys-and-values = (keys, values) -> { [ (key), (values[index]) ] for key, index in keys }

    each-object-member = (object, proc) ->

      for key, value of object => proc key, value, object
      object

    {
      is-object,
      object-member-names, object-member-pairs,
      each-object-member,
      object-from-keys-and-values
    }