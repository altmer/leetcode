# hello_test.rb
require "test/unit"
require_relative './word_break'

class WordBreakTest < Test::Unit::TestCase
  def test_word_break
    assert_equal true, WordBreak.new("leetcode", ["leet","code"]).perform
  end

  def test_word_break_apple
    assert_equal true, WordBreak.new("applepenapple", ["apple","pen"]).perform
  end

  def test_word_break_no_path
    assert_equal false, WordBreak.new("catsandog", ["cats","dog","sand","and","cat"]).perform
  end
end
