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
      print "#{process(input)}\n"
    end
  end
end

l = Lisp.new
l.repl
