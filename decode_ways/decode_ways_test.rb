# hello_test.rb
require "test/unit"
require_relative './decode_ways'

class LanguageFilterTest < Test::Unit::TestCase
  def test_counting
    assert_equal 2, DecodeWays.new("12").perform
    assert_equal 3, DecodeWays.new("226").perform
    assert_equal 0, DecodeWays.new("06").perform
  end
end
