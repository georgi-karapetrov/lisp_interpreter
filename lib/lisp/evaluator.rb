require_relative 'utils/env_primitives'

class Evaluator
  def initialize
    @global_env = LIST_PRIMITIVES
                  .merge(OPERATORS)
                  .merge(BOOLEAN)
                  .merge(STRINGS)
                  .merge(FUNCTIONS)
  end

  def evaluate(exp, env = @global_env)
    return exp if exp.is_a? Numeric
    return exp.gsub('#\\', '') if exp.is_a?(String) && exp.include?('#\\')
    return exp.delete('"') if exp.is_a?(String)
    return env[exp] if exp.is_a? Symbol

    case exp[0]
    when :quote
      exp[1..-1]
    when :if
      _, test, then_clause, else_clause = exp
      exp = evaluate(test, env) ? then_clause : else_clause
      evaluate(exp, env)
    when :define
      _, var, e = exp
      env[var] = evaluate(e, env)
    when :lambda
      _, params, e = exp
      ->(*args) { evaluate(e, env.merge(Hash[params.zip(args)])) }
    else
      procedure = evaluate(exp[0], env)
      args = exp[1..-1].map { |arg| evaluate(arg, env) }
      procedure.call(*args)
    end
  end
end
