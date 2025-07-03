
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

    find-array-item = (array, predicate, initial-item-index = 0) ->

      for item, index in array when index >= initial-item-index and predicate item, index, array => return item
      null

    array-item-index = (array, item, initial-item-index = 0) ->

      for value, index in array when index >= initial-item-index and value is item => return index
      null

    {
      is-array,
      array-size,
      map-array-items,
      first-middle-and-last-array-items,
      keep-array-items, drop-array-items,
      each-array-item,
      find-array-item,
      array-item-index
    }