require_relative 'lisp/evaluator'
require_relative 'lisp/parser'

#neat monkey patching
class Proc
  def to_s
  '#<procedure>'
  end
end

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
      print("lisp >>> ")
      input = gets
      self.pretty_print_output(input)
    end
  end

  def lispy_string(exp)
    return '#t' if exp == true
    return '#f' if exp == false
    return "#\\#{exp}" if exp.is_a?(String) and exp.length == 1
    return "\"#{exp}\"" if exp.is_a?(String)

    if exp.is_a?(Array)
      exp_flattened = exp.flatten(1)
      return "'#{exp.join(' ')}" if exp_flattened.is_a?(Array) and exp_flattened.length == 1
      return "'(#{exp.join(' ')})" if exp_flattened.is_a?(Array)
    end
    exp
  end

  def pretty_print_output(input)
    print "#{lispy_string(process(input))}\n"
  end
end
