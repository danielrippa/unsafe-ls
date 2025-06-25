
  do ->

    is-array = -> (typeof! it) is 'Array'

    array-size = (.length)

    map-array-items = (array, fn) -> [ (fn item, index, array) for item, index in array ]

    first-middle-and-last-array-items = (array) ->

      return null if (array-size array) < 2

      [ first, ...middle, last ] = array
      { first, middle, last }

    keep-array-items = (array, fn) -> [ (item) for item, index in array when fn item, index, array ]

    drop-array-items = (array, fn) -> keep-array-items array, -> not fn ...

    each-array-item = (array, proc) ->

      for item, index in array => proc item, index, array
      array

    find-array-item = (array, predicate) ->

      for item, index in array when predicate item, index, array => return item
      null

    {
      is-array,
      array-size,
      map-array-items,
      first-middle-and-last-array-items,
      keep-array-items, drop-array-items,
      each-array-item,
      find-array-item
    }