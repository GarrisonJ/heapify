# frozen_string_literal: true

RSpec.describe Heapify do
  it "has a version number" do
    expect(Heapify::VERSION).not_to be nil
  end

  describe "ArrayExtension" do
    let(:array) { [3, 2, 1] }

    describe "#heapify" do
      it "returns a min heap" do
        expect(array.heapify).to eq([1, 2, 3])
      end

      it "works on objects that have a <=> method defined" do
        array = [[1, :dog], [3, :cat], [2, :bird]]
        expect(array.heapify).to eq([[1, :dog], [3, :cat], [2, :bird]])
      end
    end

    describe "#heap_push" do
      it "adds an element to the heap" do
        array.heapify
        array.heap_push(0)
        expect(array).to eq([0, 1, 3, 2])
      end
    end

    describe "#heap_pop" do
      it "removes the minimum element from the heap" do
        array.heapify
        expect(array.heap_pop).to eq(1)
        expect(array).to eq([2, 3])
      end
    end

    # Check if heap can be used in Dijkstra's Algorithm
    describe "Dijkstra's Algorithm" do
      let(:graph) do
        {
          a: { b: 1, c: 4 },
          b: { a: 1, c: 2, d: 5 },
          c: { a: 4, b: 2, d: 1 },
          d: { b: 5, c: 1 }
        }
      end

      it "returns the shortest path" do
        # Initialize the distance hash
        distance = Hash.new(Float::INFINITY)
        distance[:a] = 0

        # Initialize the heap
        heap = []
        heap.push([0, :a])

        until heap.empty?
          current_distance, current_vertex = heap.heap_pop

          next if current_distance > distance[current_vertex]

          graph[current_vertex].each do |neighbor, weight|
            new_distance = current_distance + weight

            if new_distance < distance[neighbor]
              distance[neighbor] = new_distance
              heap.heap_push([new_distance, neighbor])
            end
          end
        end

        expect(distance).to eq({ a: 0, b: 1, c: 3, d: 4 })
      end
    end
  end
end
