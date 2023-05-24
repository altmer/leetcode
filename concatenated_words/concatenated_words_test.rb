# hello_test.rb
require "test/unit"
require_relative './concatenated_words'

class ConcatenatedWordsTest < Test::Unit::TestCase
  def test_concatenated_words
    assert_equal(
      ["catsdogcats","dogcatsdog","ratcatdogcat"],
      ConcatenatedWords.new(["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]).perform
    )
  end

  def test_concatenated_words_2
    assert_equal(
      ["catdog"],
      ConcatenatedWords.new(["cat","dog","catdog"]).perform
    )
  end

  def test_concatenated_words_2
    assert_equal(
      ["ab"],
      ConcatenatedWords.new(["a","b","ab","abc"]).perform
    )
  end
end
