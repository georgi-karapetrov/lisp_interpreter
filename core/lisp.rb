require './evaluator.rb'
require '../utils/lisp_string.rb'

class Lisp
  def parse(string)
    tokens = tokenize(string)
    read_tokens(tokens)
  end

  def tokenize(string)
    lisp_string = LispString.new(string).balance_whitespaces.pretty_parenthesise

    p "lisp_string = #{lisp_string}"
    lisp_string.split(' ')
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

lisp = Lisp.new
parsed = lisp.parse ('(define pi 3.14)')

p "parsed = #{parsed}"
p "evaled = #{Evaluator.new.evaluate(parsed)}"


