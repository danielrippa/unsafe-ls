
  do ->

    code-unit-at-index = (string, index) -> string.char-code-at 0

    string-as-code-units = (string) -> [ (char `code-unit-at-index` 0) for char in string / '' ]

    code-units-as-string = (code-units) -> String |> (.from-char-code) |> (.apply null, code-units)

    code-unit-as-string = (code-unit) -> code-units-as-string [ code-unit ]

    {
      code-unit-at-index,
      string-as-code-units,
      code-units-as-string, code-unit-as-string
    }

