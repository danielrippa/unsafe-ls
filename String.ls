
  do ->

    string-size = (.length)

    repeat-string = (string, n) -> string * n

    #

    circumfix = (stem, [ prefix = '', suffix = prefix ]) -> "#prefix#stem#suffix"

    single-quotes = -> it `circumfix` <[ ' ]>
    double-quotes = -> it `circumfix` <[ " ]>

    parens = -> it `circumfix` <[ ( ) ]>
    braces = -> it `circumfix` <[ { } ]>

    square-brackets = -> it `circumfix` <[ [ ] ]>
    angle-brackets  = -> it `circumfix` <[ < > ]>

    #

    take-first-chars = (string, n) -> string.slice 0, n
    drop-first-chars = (string, n) -> string.slice n

    take-last-chars = (string, n) -> string.slice -n
    drop-last-chars = (string, n) -> string.slice 0, (string-size string) - n

    take-chars-interval = (string, start, end) -> string.slice start, end
    drop-chars-interval = (string, start, end) -> "#{ take-first-chars string, start }#{ drop-first-chars string, end }"

    take-chars-segment = (string, start, n) -> string.slice start, start + n
    drop-chars-segment = (string, start, n) -> "#{ take-first-chars string, start }#{ drop-first-chars string, start + length }"

    #

    padl = (value, count, padding = '0') -> "#{ repeat-string padding, count }#value" |> take-last-chars  _ , count
    padr = (value, count, padding = ' ') -> "#value#{ repeat-string padding, count }" |> take-first-chars _ , count

    #

    empty-if-void = -> if it is void then '' else it

    string-from-template = (template, values) -> [ ("#literal#{ empty-if-void values[index] }") for literal, index in template / '#' ] * ''

    string-segment-index = (string, segment) -> index = string.index-of segment ; if index is -1 then null else index

    #

    lower-case = (.to-lower-case!)
    upper-case = (.to-upper-case!)

    #

    trim-regex = /^[\s]+|[\s]+$/g

      # ^[\s]+ : ^ asserts the position at the start of the line
      #        : \s matches any whitespace character one or more times (+)

      # | : acts as an alternatives separator
      #   : allows the regex to match either the pattern before or the pattern after it

      # [\s]+$ : the $ symbol asserts the position at the end of the line

      # the regex matches both leading and trailing whitespace characters

    trim = (.replace trim-regex, '')

    #

    camel-regex = /[-_]+(.)?/g

      # [-_]+ : matches one or more occurrences of either a hyphen - or an underscore _
      #       : the square brackets [] create a character set, and the + means one or more

      # (.)? : the parentheses () create a capturing group
      #      : inside the group there is a dot . which matches any single character except a newline.
      #      : the ? after the group makes it optional, meaning it can appear zero or one time

    camel-case = (.replace camel-regex, -> upper-case &1 ? '')

    #

    dash-lower-upper = (, lower, upper) -> "#{ lower }-#{ if upper.length > 1 then upper else lower-case upper }"

    dash-upper = (, upper) -> if upper.length > 1 then "#upper-" else lower-case upper

    upper-lower-regex = /([^-A-Z])([A-Z]+)/g

    replace-upper-lower = (.replace upper-lower-regex, dash-lower-upper)

    upper-regex = /^([A-Z]+)/

    replace-upper = (.replace upper-regex, dash-upper)

    kebab-case = -> it |> replace-upper-lower |> replace-upper

    #

    capital-regex = /\b\w/g

      # \b : matches a position where a word boundary occurs
      #    : it does not match an actual character, it identifies a position between characters
      #    : matches the transition from a word character (such as letters, digits, underscores) to a non-word character
      #    : matches the transition from a non-word character to a word-character

      # \w : represents a word character
      #    : matches letters (both uppercase and lowercase), digits, underscores

      # together they match all word boundaries followed by word characters

    capital-case = (.replace capital-regex, upper-case)

    #

    words-regex = /[ ]+/

    string-as-words = ->

      switch it.length

        | 0 => []

        else it.split words-regex

    words-as-string = (.join ' ')

    {
      repeat-string,
      circumfix,
      single-quotes, double-quotes,
      parens, braces,
      square-brackets, angle-brackets,
      take-first-chars, drop-first-chars,
      take-last-chars,  drop-last-chars,
      take-chars-interval, drop-chars-interval,
      take-chars-segment, drop-chars-segment,
      padl, padr,
      string-from-template,
      string-segment-index,
      trim,
      upper-case, lower-case,
      camel-case, kebab-case,
      capital-case,
      string-as-words,
      words-as-string
    }