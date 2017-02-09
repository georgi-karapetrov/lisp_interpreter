LIST_PRIMITIVES = {
  list: ->(*list) { Array.new(list) },
  car: ->(*list) { list[0] },
  cdr: ->(*list) { list.drop(1) },
  cons: ->(head, *tail) { [head] + tail },
}

OPERATORS = {
  :+ => ->(*list) { list.reduce(:+) },
  :* => ->(*list) { list.reduce(:*) },
  :- => ->(*list) { list.reduce(:-) },
  :/ => ->(*list) { list.reduce(:/) },
  :== => ->(lhs, rhs) { lhs == rhs },
  :!= => ->(lhs, rhs) { lhs != rhs },
}
