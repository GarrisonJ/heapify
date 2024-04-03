# Heapify

Inspired by Python's heapq module, Heapify is a Ruby library that provides methods to transform an array into a min heap. A min heap is a binary tree where the parent node is less than or equal to its children.

The API below differs from textbook heap algorithms in two aspects: (a) We use zero-based indexing. This makes the relationship between the index for a node and the indexes for its children slightly less obvious, but is more suitable since Ruby uses zero-based indexing. (b) Our pop method returns the smallest item, not the largest (called a “min heap” in textbooks; a “max heap” is more common in texts because of its suitability for in-place sorting).

These two make it possible to view the heap as a regular Ruby list without surprises: heap[0] is the smallest item, and heap.sort maintains the heap invariant!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heapify'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install heapify
```

## Usage

Heapify extends the Array class with the following methods:

### `heapify`

Transforms an array into a heap in-place. It has a time complexity of O(n) and a space complexity of O(1).

```ruby
array = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
array.heapify
# array => [1, 2, 3, 4, 7, 9, 10, 14, 8, 16]
```

### `heap_push(val)`

This method adds an element to the heap. It has a time complexity of O(log n) and a space complexity of O(1).

```ruby
array = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
array.heapify
array.heap_push(5)
# array => [1, 2, 3, 4, 5, 9, 10, 14, 8, 7, 16]
```

### `heap_pop`

This method removes the smallest element from the heap and returns it. It has a time complexity of O(log n) and a space complexity of O(1).

```ruby
array = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
array.heapify
array.heap_pop
# => 1
# array => [2, 4, 3, 7, 16, 9, 10, 14, 8]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/garrisonj/heapify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Heapify project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/garrisonj/heapify/blob/master/CODE_OF_CONDUCT.md).
