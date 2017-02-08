LIST_PRIMITIVES = {
  car: ->(*list) { list.first },
  cdr: ->(*list) { list.drop(1) },
  cons: ->(head, tail) { [head] + tail },
}
