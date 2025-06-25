
  do ->

    { string-between, first-index-of, string-contains } = dependency 'unsafe.String'

    is-function = -> (typeof it) is 'function'

    comma = ', '

    contains-comma = -> it `string-contains` comma

    decompose-function = (fn) ->

      fn |> (.to-string!)

        name  = string-between .. , [ ' ' '(' ]

        param = string-between .. , <[ ( ) ]>
        code  = string-between .. , <[ { } ]>, yes

      parameter-names = match param

        | (== '') => []
        | contains-comma => param / "#comma"

        else [ param ]

      { name, parameter-names, code }

    function-name = -> decompose-function it .name
    function-code = -> decompose-function it .code

    function-parameter-names = -> decompose-function it .parameter-names

    {
      is-function,
      function-name, function-code, function-parameter-names
    }

