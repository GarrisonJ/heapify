# frozen_string_literal: true

require_relative "heapify/version"

module Heapify
  # Provides a heapify method for arrays. It also provides methods for adding and removing elements from the heap.
  module ArrayExtension
    # Transforms an array into a heap, in-place, in linear time.
    #
    # @return [Array] The heapified array.
    def heapify
      (size / 2).downto(0) do |i|
        heapify_down(i)
      end
      self
    end

    # Add an element to the heap.
    #
    # O(log n) time complexity.
    #
    # @param val [Object] The value to be added to the heap.
    # @return [void]
    def heap_push(val)
      self << val
      heapify_up(size - 1)
    end

    # Remove the minimum element from the heap.
    #
    # O(log n) time complexity.
    #
    # @return [Object, nil] The minimum element from the heap, or nil if the heap is empty.
    def heap_pop
      return if empty?

      swap(0, size - 1)
      min = pop
      heapify_down(0)
      min
    end

    private

    def heapify_down(index)
      smallest = find_smallest(index)

      return if smallest == index

      swap(index, smallest)
      heapify_down(smallest)
    end

    # Find the smallest element between the current index and its children.
    def find_smallest(index)
      left = (2 * index) + 1
      right = (2 * index) + 2
      smallest = index

      smallest = left if left < size && (self[left] <=> self[smallest]) == -1
      smallest = right if right < size && (self[right] <=> self[smallest]) == -1

      smallest
    end

    def heapify_up(index)
      parent = (index - 1) / 2

      return if index.zero? || (self[parent] <=> self[index]) <= 0

      swap(index, parent)
      heapify_up(parent)
    end

    def swap(index1, index2)
      self[index1], self[index2] = self[index2], self[index1]
    end
  end
end

Array.include Heapify::ArrayExtension
