
  do ->

    item-index = (array, item) ->

      for value, index in array when item is value
        return index
      void

    array-size = (array) -> array.length

    take-first-items = (array, n) -> array.slice 0, n
    drop-first-items = (array, n) -> array.slice n

    take-last-items = (array, n) -> array.slice -n
    drop-last-items = (array, n) -> array.slice 0, -n

    take-array-interval = (array, start, end) -> array.slice start, end
    drop-array-interval = (array, start, end) -> (take-first-items array, start) ++ (drop-first-items array, end)

    take-array-segment = (array, start, length) -> array.slice start, start+length
    drop-array-segment = (array, start, length) -> drop-array-interval array, start, start+length

    inject-array-segment = (array, segment, position) -> (take-first-items array, position) ++ segment ++ (drop-first-items array, position)

    repeat-item = (item, n) -> [ (item) for index til n ]

    {
      array-size,
      item-index,
      take-first-items, drop-first-items,
      take-last-items,  drop-last-items,
      take-array-interval, drop-array-interval,
      take-array-segment, drop-array-segment,
      inject-array-segment,
      repeat-item
    }