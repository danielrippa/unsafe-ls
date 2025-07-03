
  do ->

    { separators: { rs: record-separator }, crlf, lf } = dependency 'unsafe.Constants'
    { string-replace-segment } = dependency 'unsafe.String'

    string-as-lines = (string) ->

      string

        |> _ `string-replace-segment` [ crlf, record-separator, yes ]
        |> _ `string-replace-segment` [ lf,   record-separator, yes ]

        |> (/ "#record-separator")

    lines-as-string = (lines, separator = lf) -> lines * "#separator"

    {
      string-as-lines, lines-as-string
    }