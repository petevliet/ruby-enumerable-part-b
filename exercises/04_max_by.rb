def max_by(items, &block)
  n = 0
  answer = nil
  items.each do |item|
    sum = block.call(item)
     if sum > n
       n = sum
       answer = item
     end
  end
  answer
end

# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#max_by' do
  it 'returns the longest word in an array' do
    input = ['a', 'big', 'black', 'bear', 'is', 'running']

    expect(max_by(input) { |word| word.length }).to eq('running')
  end

  it 'returns the first longest word if there are multiples' do
    input = ['fa', 'la']

    expect(max_by(input) { |word| word.length }).to eq('fa')
  end

  it 'returns the largest number in the list by comparing the numbers' do
    input = [1, 2, 512, 4, 256, 8]

    expect(max_by(input) { |num| num }).to eq(512)
  end

  it 'returns nil when given an empty array, regardless of the given block' do
    expect(max_by([]) { |foos| foos.foo_method }).to eq(nil)
  end
end
