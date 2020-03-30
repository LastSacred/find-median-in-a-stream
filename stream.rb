class Stream
  def initialize(input)
    @integers = format_in(input)
  end

  def medians
    @medians ||= begin
      @lower_half = PriorityQueue::Max.new
      @upper_half = PriorityQueue::Min.new

      @integers.map do |integer|
        stream_step(integer)
        median
      end
    end

    format_out(@medians)
  end

  private

  def stream_step(integer)
    if @lower_half.count < @upper_half.count
      return @lower_half << integer if integer <= @upper_half.first
      @lower_half << @upper_half.shift
      @upper_half << integer
    elsif @lower_half.count > @upper_half.count
      return @upper_half << integer if integer >= @lower_half.first
      @upper_half << @lower_half.shift
      @lower_half << integer
    else
      return @lower_half << integer if @lower_half.count == 0
      return @lower_half << integer if integer < @upper_half.first
      @upper_half << integer
    end
  end

  def median
    return @upper_half.first if @lower_half.count < @upper_half.count
    return @lower_half.first if @lower_half.count > @upper_half.count
    (@lower_half.first + @upper_half.first) / 2
  end

  def format_in(input)
    input.split("\n").drop(1).map(&:to_i)
  end

  def format_out(output)
    output.join("\n")
  end
end