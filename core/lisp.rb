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
      self.pretty_print_output(input)
    end
  end

  def lispy_string(exp)
    return '#t' if exp == true
    return '#f' if exp == false
    return "'(#{exp.join(", ")})" if exp.is_a?(Array)
    exp
  end

  def pretty_print_output(input)
    print "#{lispy_string(process(input))}\n"
  end
end

l = Lisp.new
if ARGV.size > 0
  src = open(ARGV[0], 'r'){ |file| file.read }
  p src
  src.split("\n").each { |entry| l.pretty_print_output(entry)}
else
  l.repl
end
