require 'lisp'

RSpec.describe Lisp do

	it 'creates a new LISP instance' do
		lisp = Lisp.new
		expect(lisp.class).to be Lisp
	end

	let(:list) { '(list 1 2 3)' }
	it 'creates a new list' do
		lisp = Lisp.new
		expect(lisp.generate_output(list)).to eq "'(1 2 3)\n"
	end

	let(:car) { '(car (list 1 2 3))' }
	it 'gets the head of a list' do
		lisp = Lisp.new
		expect(lisp.generate_output(car)).to eq "1\n"
	end

	let(:cdr) { '(cdr (list 1 2 3))' }
	it 'gets the tail of a list' do
		lisp = Lisp.new
		expect(lisp.generate_output(cdr)).to eq "'(2 3)\n"
	end

	let(:cdr_no_tail) { '(cdr (list 1))' }
	it 'gets the tail of a tailless list' do
		lisp = Lisp.new
		expect(lisp.generate_output(cdr_no_tail)).to eq "'()\n"
	end

	let(:not_true) { '(not #t)' }
	it 'nots true' do
		lisp = Lisp.new
		expect(lisp.generate_output(not_true)).to eq "#f\n"
	end

	let(:not_false) { '(not #f)' }
	it 'nots false' do
		lisp = Lisp.new
		expect(lisp.generate_output(not_false)).to eq "#t\n"
	end

	let(:foldl) { '(foldl + 0 (list 1 2 3))' }
	it 'folds to one value' do
		lisp = Lisp.new
		expect(lisp.generate_output(foldl)).to eq "6\n"
	end

	let(:compose) { '((compose (lambda (x) (+ x 1)) (lambda (x) (* x 2))) 2)' }
	it 'composes lambdas' do
		lisp = Lisp.new
		expect(lisp.generate_output(compose)).to eq "6\n"
	end
end