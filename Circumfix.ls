
  do ->

    circumfix = (stem, [ prefix, suffix = prefix ]) -> "#prefix#stem#suffix"

    wrap = -> circumfix _ , it / ''

    [ curly-brackets, square-brackets, round-brackets, angle-brackets ] = [ (wrap chars) for chars in '{} [] () <>' / ' ' ]
    [ single-quotes, double-quotes ] = [ (wrap chars) for chars in <[ ' " ]> ]

    {
      circumfix,
      curly-brackets, square-brackets, round-brackets, angle-brackets,
      single-quotes, double-quotes
    }
