LIST_PRIMITIVES = {
  list: ->(*list) { Array(list) },
  car: ->(*list) { list[0] },
  cdr: ->(*list) { list.drop(1) },
  cons: ->(head, *tail) { [head] + tail },
  length: ->(*list) {list.flatten.length},
}

OPERATORS = {
  :+ => ->(*list) { list.reduce(:+) },
  :* => ->(*list) { list.reduce(:*) },
  :- => ->(*list) { list.reduce(:-) },
  :/ => ->(*list) { list.reduce(:/) },
  :== => ->(lhs, rhs) { lhs == rhs },
  :!= => ->(lhs, rhs) { lhs != rhs },
  :> => ->(lhs, rhs) { lhs > rhs },
  :< => ->(lhs, rhs) { lhs < rhs },
  :>= => ->(lhs, rhs) { lhs >= rhs },
  :<= => ->(lhs, rhs) { lhs <= rhs },
  :quotient => ->(lhs, rhs) { (lhs / rhs).truncate },
  :remainder => ->(lhs, rhs) { lhs != rhs },
  :modulo => ->(lhs, rhs) { lhs % rhs },
  :numerator => ->(lhs) { Rational(lhs).numerator },
  :denominator => ->(lhs) { Rational(lhs).denominator },
  :abs => ->(lhs) { lhs.abs }
}

BOOLEAN = {
  :not => ->(exp) { not exp },
  :equal? => ->(lhs, rhs) { lhs == rhs },
  "#t" => true,
  "#f" => false,
}
