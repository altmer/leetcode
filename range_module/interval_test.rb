# hello_test.rb
require "test/unit"
require_relative './range_module'

class IntervalTest < Test::Unit::TestCase
  def test_intersect
    interval = Interval.new(0, 1)
    other = Interval.new(1, 4)
    assert interval.intersects?(other)
    assert other.intersects?(interval)
  end

  def test_no_intersection
    interval = Interval.new(0, 1)
    other = Interval.new(2, 4)
    refute interval.intersects?(other)
    refute other.intersects?(interval)
  end

  def test_merge
    interval = Interval.new(0, 3)
    other = Interval.new(1, 4)

    interval.merge!(other)

    assert_equal interval.left, 0
    assert_equal interval.right, 4
  end

  def test_contains
    assert Interval.new(5, 8).contains?(Interval.new(6, 8))
    assert Interval.new(5, 8).contains?(Interval.new(5, 8))
    refute Interval.new(5, 8).contains?(Interval.new(7, 9))
  end
end
