require 'cmath'

class Proc
  def *(f)
    ->(*args) { self.(f.(*args)) }
  end
end

LIST_PRIMITIVES = {
  list: ->(*list) { Array(list) },
  car: ->(*list) { list[0] },
  cdr: ->(*list) { list.drop(1) },
  map: ->(procedure, list) { list.flatten(1).map &procedure },
  foldl: ->(procedure, init, *list) { list.flatten(1).reduce(init, &procedure) },
  filter: ->(pred, *list) { list.flatten(1).select &procedure },
  member: ->(elem, list) { list.include?(elem) ? list[list.index(elem)..-1] : false },
  cons: ->(head, *tail) { [head] + tail },
  null?: ->(*list) { list.nil? },
  null: [],
  length: ->(*list) {list.flatten.length},
  max: ->(*list) { list.max },
  min: ->(*list) { list.min },
}

OPERATORS = {
  :+ => ->(*list) { list.reduce(:+) },
  :* => ->(*list) { list.reduce(:*) },
  :- => ->(*list) { list.reduce(:-) },
  :/ => ->(*list) { list.reduce(:/) },
  :'=' => ->(*list) { list.uniq.length == 1 },
  :!= => ->(*list) { list.uniq.length != 1 },
  :> => ->(*list) { list.each_cons(2).all? { |lhs, rhs| lhs > rhs } },
  :< => ->(*list) { list.each_cons(2).all? { |lhs, rhs| lhs < rhs } },
  :>= => ->(*list) { list.each_cons(2).all? { |lhs, rhs| lhs >= rhs } },
  :<= => ->(*list) { list.each_cons(2).all? { |lhs, rhs| lhs <= rhs } },
  :quotient => ->(lhs, rhs) { (lhs / rhs).truncate },
  :remainder => ->(lhs, rhs) { lhs != rhs },
  :modulo => ->(lhs, rhs) { lhs % rhs },
  :numerator => ->(lhs) { Rational(lhs).numerator },
  :denominator => ->(lhs) { Rational(lhs).denominator },
  :abs => ->(lhs) { lhs.abs },
  :add1 => ->(lhs) { lhs + 1 },
  :sub1 => ->(lhs) { lhs - 1 },
  :sqrt => ->(lhs) { CMath.sqrt(lhs) },
  :expt => -> (lhs, rhs) { lhs ** rhs },
}

STRINGS = {
  :'string-length' => ->(str) { str.length },
  :substring => ->(str, from, to = -1) { str[from..to] },
  :'string-upcase' => ->(str) { str.upcase },
  :'string-contains?' => ->(str, contained) { str.incude?(contained) },
  :'string->list' => ->(str) { str.chars },
  :'string-split' => ->(str, sep, trim = true, repeat = false) { str.chars },
}

FUNCTIONS = {
  apply: -> (proc, *args) { args.flatten.reduce(&proc) },
  compose: -> (*procs) { procs.reverse.reduce(:*) },
}

BOOLEAN = {
  :not => ->(exp) { not exp },
  :equal? => ->(lhs, rhs) { lhs == rhs },
  :'#t' => true,
  :'#f' => false,
}
