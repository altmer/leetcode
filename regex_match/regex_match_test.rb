# hello_test.rb
require "test/unit"
require_relative './regex_match'

class RegexMatchTest < Test::Unit::TestCase
  def test_matching
    assert_equal false, RegexMatch.new("aa", "a").perform
  end

  def test_matching_all_a
    assert_equal true, RegexMatch.new("aa", "a*").perform
  end

  def test_matching_all_any
    assert_equal true, RegexMatch.new("ab", ".*").perform
  end

  def test_no_match
    assert_equal false, RegexMatch.new("a", "ab*a").perform
  end

  def test_no_match_a
    assert_equal false, RegexMatch.new("aaa", "aaaa").perform
  end
end
