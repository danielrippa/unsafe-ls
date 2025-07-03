
  do ->

    { is-array } = dependency 'unsafe.Array'

    is-object = (value) -> return no unless (typeof value) is 'object' ; return no if is-array value ; value?

    object-member-names = (object) -> [ (member-name) for member-name of object ]

    object-member-values = (object) -> [ (member-value) for member-name, member-value of object ]

    object-member-pairs = (object) -> [ [ name, value ] for name, value of object ]

    object-from-array = (array) -> { [ value, value ] for value in array }

    object-from-keys-and-values = (keys, values) -> { [ (key), (values[index]) ] for key, index in keys }

    object-from-member-pairs = (pairs) -> { [ pair.0, pair.1 ] for pair in pairs }

    id = -> it

    map-object = (object, key-fn = id, value-fn = id) -> { [ (key-fn key, value, object), (value-fn value, key, object) ] for key, value of object }

    each-object-member = (object, proc) ->

      for key, value of object => proc key, value, object
      object

    {
      is-object,
      map-object,
      object-from-array,
      object-member-names, object-member-pairs, object-member-values,
      each-object-member,
      object-from-keys-and-values, object-from-member-pairs
    }