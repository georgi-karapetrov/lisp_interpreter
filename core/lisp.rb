class String
  def balance_whitespaces
    self.gsub(/\s\s+/, ' ')
  end

  def pretty_parenthesise
    self.gsub('(', ' ( ').gsub(')', ' ) ')
  end
end

class Lisp
  def parse(string)
    tokenize(string)
  end

  def tokenize(string)
    lisp_string = string.balance_whitespaces.pretty_parenthesise
    lisp_string.split(' ').map {|token| atom(token)}.compact
  end

  def atom(token)
    return token.to_f if token[/\.\d+/]
    return token.to_i if token[/\d+/]
    return nil if token == '(' || token == ')'
    token.to_sym
  end

  def read_tokens(tokens)
    return if tokens.empty?

    token = tokens.shift
    case token
    when '('
      list = []
      # may break here
      list << read_tokens(tokens) while tokens.first != ')'


  end
end

lisp = Lisp.new
p lisp.parse ('(+ (* 2 2) (-5 3))')
