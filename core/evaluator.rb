require '../utils/env_primitives.rb'

class Evaluator
  def initialize
    @env = LIST_PRIMITIVES
  end

  def evaluate(exp)
    
    return exp if exp.is_a? Numeric
    return @env[exp] if exp.is_a? Symbol
    
    case exp[0]
    when :define
      _, var, e = exp
      @env[var] = evaluate(e)
    else
      code = evaluate(exp[0])
      args = exp[1..-1].map { |arg| eval(arg) }
      code.(*args)
    end
  end
end
