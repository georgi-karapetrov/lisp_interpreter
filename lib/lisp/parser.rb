require_relative 'utils/lisp_string'

# Used to parse the user input string,
# generate tokens and parse them
class Parser
  def parse(string)
    tokens = tokenize(string)
    read_tokens(tokens)
  end

  def tokenize(string)
    lisp_string = LispString.new(string).balance_whitespaces.pretty_parenthesise
    lisp_string.split(' ')
  end

  def atom(token)
    return token.to_f if token[/\.\d+/]
    return token.to_i if token[/\d+/]
    return token if token.include?('"') || token.include?('#\\')
    token.to_sym
  end

  def read_tokens(tokens)
    return if tokens.empty?
    token = tokens.shift
    case token
    when '('
      list = []
      list << read_tokens(tokens) while tokens.first != ')'
      tokens.shift
      list
    when ')'
      raise 'Unbalanced parentheses'
    else
      atom(token)
    end
  end
end
