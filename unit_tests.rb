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

	let(:sum) { '(+ 1 2 3)' }
	it 'sums elements of list' do
		lisp = Lisp.new
		expect(lisp.generate_output(sum)).to eq "6\n"
	end

	let(:string_length) { '(string-length "abcde")' }
	it 'sums elements of list' do
		lisp = Lisp.new
		expect(lisp.generate_output(string_length)).to eq "5\n"
	end

	let(:truthy) { '#t' }
	it 'tests for truthy' do
		lisp = Lisp.new
		expect(lisp.generate_output(truthy)).to eq "#t\n"
	end

	let(:falsy) { '#f' }
	it 'tests for falsy' do
		lisp = Lisp.new
		expect(lisp.generate_output(falsy)).to eq "#f\n"
	end

	let(:quotient) { '(quotient 10 3)' }
	it 'calculates quotient' do
		lisp = Lisp.new
		expect(lisp.generate_output(quotient)).to eq "3\n"
	end

	let(:has_member) { '(member 2 (list 1 2 3 4))' }
	it 'checks if list has member' do
		lisp = Lisp.new
		expect(lisp.generate_output(has_member)).to eq "'(2 3 4)\n"
	end

	let(:does_not_have_member) { '(member 5 (list 1 2 3 4))' }
	it 'checks if list does not have member' do
		lisp = Lisp.new
		expect(lisp.generate_output(does_not_have_member)).to eq "#f\n"
	end

	let(:list_is_ascending) { '(> (list 1 2 3 4))' }
	it 'checks if a list is in ascending order' do
		lisp = Lisp.new
		expect(lisp.generate_output(list_is_ascending)).to eq "#t\n"
	end
end