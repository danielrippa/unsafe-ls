
  do ->

    { backslash } = dependency 'unsafe.Constants'
    { string-remove-segment: remove-segment, string-replace-segment: replace-segment } = dependency 'unsafe.String'

    whitespace = "#{backslash}s+"

    at-start = caret = '^'
    at-end = dollar-sign = '$'

    leading-whitespace = "#at-start#whitespace"
    trailing-whitespace = "#whitespace#at-end"

    trimmed-string = (string) -> string `remove-segment` [ "#leading-whitespace|#trailing-whitespace", yes ]

    whitespace-as-separator = (string, separator = '_') -> string `replace-segment` [ whitespace, yes ]

    {
      trimmed-string,
      whitespace-as-separator
    }