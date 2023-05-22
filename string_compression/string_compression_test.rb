# hello_test.rb
require "test/unit"
require_relative './string_compression'

class StringCompressionTest < Test::Unit::TestCase
  def test_compress
    chars = ["a","a","b","b","c","c","c"]
    compressor = StringCompression.new(chars)
    assert_equal 6, compressor.perform
    assert_equal ["a","2","b","2","c","3"], chars[0..5]
  end

  def test_compress_single_char
    chars = ["a"]
    compressor = StringCompression.new(chars)
    assert_equal 1, compressor.perform
    assert_equal ["a"], chars
  end

  def test_compress_double_digit
    chars = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
    compressor = StringCompression.new(chars)
    assert_equal 4, compressor.perform
    assert_equal ["a","b","1","2"], chars[0..3]
  end
end
