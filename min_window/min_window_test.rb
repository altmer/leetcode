# hello_test.rb
require "test/unit"
require_relative './min_window'

class MinWindowTest < Test::Unit::TestCase
  def test_min_window
    assert_equal(
      "BANC",
      MinWindow.new("ADOBECODEBANC", "ABC").perform
    )
  end

  def test_min_window_whole
    assert_equal(
      "a",
      MinWindow.new("a", "a").perform
    )
  end

  def test_no_window
    assert_equal(
      "",
      MinWindow.new("a", "aa").perform
    )
  end

  def test_ab_a
    assert_equal(
      "a",
      MinWindow.new("ab", "a").perform
    )
  end

  def test_not_greedy
    assert_equal(
      "cwae",
      MinWindow.new("cabwefgewcwaefgcf", "cae").perform
    )
  end
end
