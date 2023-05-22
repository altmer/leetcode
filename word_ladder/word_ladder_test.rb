# hello_test.rb
require "test/unit"
require_relative './word_ladder'

class WordBreakTest < Test::Unit::TestCase
  def test_word_break
    ladder = WordLadder.new("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
    assert_equal 5, ladder.perform
  end

  def test_word_break_2
    ladder = WordLadder.new("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
    assert_equal 0, ladder.perform
  end
end
