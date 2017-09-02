require_relative 'lisp/evaluator'
require_relative 'lisp/parser'

# neat monkey patching
class Proc
  def to_s
    '#<procedure>'
  end
end

#! Main class which does the interpretation
class Lisp
  def initialize(parser = Parser.new, evaluator = Evaluator.new)
    @parser = parser
    @evaluator = evaluator
  end

  def process(string)
    parsed = @parser.parse(string)
    @evaluator.evaluate(parsed)
  end

  def repl
    loop do
      print('lisp >>> ')
      input = gets
      print generate_output(input)
    end
  end

  def lispy_string(exp)
    return '#t' if exp == true
    return '#f' if exp == false
    return "#\\#{exp}" if exp.is_a?(String) && exp.length == 1
    return "\"#{exp}\"" if exp.is_a?(String)

    if exp.is_a?(Array)
      ex_flat = exp.flatten(1)
      return "'#{exp.join(' ')}" if ex_flat.is_a?(Array) && ex_flat.length == 1
      return "'(#{exp.join(' ')})" if ex_flat.is_a?(Array)
    end
    exp
  end

  def generate_output(input)
    "#{lispy_string(process(input))}\n"
  end
end
