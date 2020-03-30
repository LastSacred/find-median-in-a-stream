class PriorityQueue
  attr_reader :integers

  def initialize
    @integers = []
  end

  def count
    @integers.count
  end

  def first
    @integers.first
  end

  def <<(integer)
    @integers << integer
    index = @integers.count

    @integers.unshift(nil)
    bubble_up(index)
    @integers.shift

    @integers
  end

  def shift
    swap(0, @integers.count - 1)
    priority_integer = @integers.pop

    @integers.unshift(nil)
    bubble_down(1)
    @integers.shift

    priority_integer
  end

  private

  def bubble_up(index)
    raise "Abstract method called"
  end

  def bubble_down(index)
    raise "Abstract method called"
  end

  def swap(source, target)
    @integers[source], @integers[target] = @integers[target], @integers[source]
  end

  class Max < PriorityQueue
    private

    def bubble_up(index)
      return if index <= 1
  
      parent_index = (index / 2)
  
      return if @integers[parent_index] >= @integers [index]
  
      swap(index, parent_index)
      bubble_up(parent_index)
    end

    def bubble_down(index)
      child_index = (index * 2)
  
      return if child_index >= @integers.count
  
      child_index += 1 if @integers[child_index + 1] && @integers[child_index] < @integers[child_index + 1]
  
      return if @integers[child_index] <= @integers[index]
  
      swap(index, child_index)
      bubble_down(child_index)
    end
  end

  class Min < PriorityQueue
    private

    def bubble_up(index)
      return if index <= 1
  
      parent_index = (index / 2)
  
      return if @integers[parent_index] <= @integers [index]
  
      swap(index, parent_index)
      bubble_up(parent_index)
    end

    def bubble_down(index)
      child_index = (index * 2)
  
      return if child_index <= @integers.count
  
      child_index += 1 if @integers[child_index + 1] && @integers[child_index] > @integers[child_index + 1]
  
      return if @integers[child_index] >= @integers[index]
  
      swap(index, child_index)
      bubble_down(child_index)
    end
  end
end