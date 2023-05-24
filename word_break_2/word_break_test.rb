# hello_test.rb
require "test/unit"
require_relative './word_break'

class WordBreakTest < Test::Unit::TestCase
  def test_word_break
    assert_equal(
      ["cats and dog","cat sand dog"].sort,
      WordBreak.new("catsanddog", ["cat","cats","and","sand","dog"]).perform.sort
    )
  end

  def test_word_break_apple
    assert_equal(
      ["pine apple pen apple","pineapple pen apple","pine applepen apple"].sort,
      WordBreak.new("pineapplepenapple", ["apple","pen","applepen","pine","pineapple"]).perform.sort
    )
  end

  def test_word_break_no_path
    assert_equal(
      [],
      WordBreak.new("catsandog", ["cats","dog","sand","and","cat"]).perform
    )
  end
end
