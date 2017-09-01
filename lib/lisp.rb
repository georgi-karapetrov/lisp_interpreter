require_relative 'lisp/evaluator'
require_relative 'lisp/parser'

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
    return "'#{exp.join(' ')}" if exp.flatten(1).is_a?(Array) and exp.flatten(1).length == 1
    return "'(#{exp.join(' ')})" if exp.flatten(1).is_a?(Array)
    exp
  end

  def pretty_print_output(input)
    print "#{lispy_string(process(input))}\n"
  end
end
