
  do ->

    { backslash } = dependency 'unsafe.Constants'
    { string-remove-segment: remove-segment } = dependency 'unsafe.String'

    whitespace = "#{backslash}s+"

    at-start = caret = '^'
    at-end = dollar-sign = '$'

    leading-whitespace = "#at-start#whitespace"
    trailing-whitespace = "#whitespace#at-end"

    trimmed-string = (string) -> string `remove-segment` [ "#leading-whitespace|#trailing-whitespace", yes ]

    {
      trimmed-string
    }