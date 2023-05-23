# hello_test.rb
require "test/unit"
require_relative './wildcard_matching'

class WordBreakTest < Test::Unit::TestCase
  # def test_matching
  #   assert_equal false, WildcardMatching.new("aa", "a").perform
  # end

  # def test_matching_all
  #   assert_equal true, WildcardMatching.new("aa", "*").perform
  # end

  # def test_matching_question
  #   assert_equal false, WildcardMatching.new("cb", "?a").perform
  # end

  def test_fail
    assert_equal false, WildcardMatching.new("aab", "c*a*b").perform
  end
end
