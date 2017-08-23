require './evaluator.rb'
require './parser.rb'

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
      print "#{lispy_string(process(input))}\n"
    end
  end

  def lispy_string(exp)
    return '#t' if exp == true
    return '#f' if exp == false
    exp
  end
end

l = Lisp.new
l.repl
