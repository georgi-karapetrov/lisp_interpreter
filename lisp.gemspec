Gem::Specification.new do |s|
  s.name        = 'lisp'
  s.version     = '1.0.0'
  s.executables << 'lisp'
  s.date        = '2017-09-01'
  s.summary     = "Interprets LISP."
  s.description = "A neat LISP interpreter."
  s.authors     = ["Georgi Karapetrov"]
  s.email       = 'gkarapetrov@gmail.com'
  s.files       = ["lib/lisp.rb", 
                   "lib/lisp/evaluator.rb", 
                   "lib/lisp/parser.rb", 
                   "lib/lisp/utils/env_primitives.rb", 
                   "lib/lisp/utils/lisp_string.rb"]
  s.license     = 'Nonstandard'
  s.homepage    = "https://github.com/georgi-karapetrov/lisp_interpreter"
end
