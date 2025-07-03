
  do ->

    { string-between, first-index-of, string-contains, string-interval } = dependency 'unsafe.String'
    { string-as-lines } = dependency 'unsafe.Text'
    { trimmed-string } = dependency 'unsafe.Whitespace'
    { keep-array-items, map-array-items } = dependency 'unsafe.Array'

    is-function = -> (typeof it) is 'function'

    comma = ', '

    contains-comma = -> it `string-contains` comma

    is-comment-line = -> it |> trimmed-string |> string-interval _ , [ 0, 2 ] |> (== '//')

    as-comments = (lines) -> map-array-items lines, (line) -> line |> trimmed-string |> string-interval _ , [ 3 ]

    decompose-function = (fn) ->

      fn |> (.to-string!)

        name  = string-between .. , [ ' ' '(' ]

        param = string-between .. , <[ ( ) ]>
        code  = string-between .. , <[ { } ]>, yes

        comments = .. |> string-as-lines |> keep-array-items _ , is-comment-line |> as-comments

      parameter-names = match param

        | (== '') => []
        | contains-comma => param / "#comma"

        else [ param ]

      { name, parameter-names, code, comments }

    function-name = -> decompose-function it .name
    function-code = -> decompose-function it .code

    function-comments = -> decompose-function it .comments

    function-parameter-names = -> decompose-function it .parameter-names

    function-execute-with-args = (fn, args) -> fn.apply null, args

    {
      is-function,
      function-name, function-code, function-parameter-names, function-comments
      function-execute-with-args
    }

