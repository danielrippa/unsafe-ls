
  do ->

    { code-unit-as-string: char } = dependency 'unsafe.CodeUnit'

    [ lf, cr, esc, backslash ] = [ (char code-unit) for code-unit in [ 10 13 27 92 ] ]

    ellipsis = '...'

    crlf = "#cr#lf"

    separators = { [ name, char index + 28 ] for name, index in <[ fs, gs, rs, us ]>  }

    {
      cr, lf, crlf,
      esc,
      backslash,
      ellipsis,
      separators
    }