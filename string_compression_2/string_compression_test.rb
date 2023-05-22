# hello_test.rb
require "test/unit"
require_relative './string_compression'

class StringCompressionTest < Test::Unit::TestCase
  def test_compress
    str = "aaabcccd"
    compressor = StringCompression.new(str, 2)
    assert_equal 4, compressor.perform
  end

  def test_compress_long
    str = "eaacaaadcedeceedbaacbcaddbbceadabeebbcbcdabaeccdedaabcdbadbddeebeecbeeaaeeecbecbacadee"
    compressor = StringCompression.new(str, 80)
    assert_equal 2, compressor.perform
  end
end
