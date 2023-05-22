class Interval
  attr_reader :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end

  def intersects?(other)
    (self.left <= other.right && self.left >= other.left) ||
      (other.left <= self.right && other.left >= self.left)
  end

  def merge!(other)
    return self unless intersects?(other)

    points = [@left, @right, other.left, other.right]
    @left = points.min
    @right = points.max

    self
  end

  def remove!(other)
    return nil unless intersects?(other)

    if other.left >= left && other.left <= right
      old_right = @right
      @right = other.left
      if other.right >= left && other.right < old_right
        return Interval.new(other.right, old_right)
      end
    else
      @left = other.right
    end
    nil
  end

  def contains?(other)
    left <= other.left && right >= other.right
  end
end

class RangeModule
    def initialize()
      @intervals = []
    end

=begin
    :type left: Integer
    :type right: Integer
    :rtype: Void
=end
    def add_range(left, right)
      new_int = Interval.new(left, right)
      intersection =  @intervals.find { |interval| interval.intersects?(new_int) }
      if intersection
        intersection.merge!(new_int)

        @intervals.map! do |interval|
          if interval == intersection || !interval.intersects?(intersection)
            interval
          else
            intersection.merge!(interval)
            nil
          end
        end.compact!
      else
        @intervals << new_int
      end
    end


=begin
    :type left: Integer
    :type right: Integer
    :rtype: Boolean
=end
    def query_range(left, right)
      query = Interval.new(left, right)
      @intervals.any? { |interval| interval.contains?(query) }
    end


=begin
    :type left: Integer
    :type right: Integer
    :rtype: Void
=end
    def remove_range(left, right)
      removal = Interval.new(left, right)
      new_intervals = []

      @intervals.map! do |interval|
        next interval unless interval.intersects?(removal)

        if removal.contains?(interval)
          nil
        else
          result = interval.remove!(removal)
          new_intervals << result if result
          interval
        end
      end.compact!

      new_intervals.each do |new_int|
        add_range(new_int.left, new_int.right)
      end
    end
end

# Your RangeModule object will be instantiated and called as such:
# obj = RangeModule.new()
# obj.add_range(left, right)
# param_2 = obj.query_range(left, right)
# obj.remove_range(left, right)