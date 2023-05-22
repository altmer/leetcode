# hello_test.rb
require "test/unit"
require_relative './range_module'

class RangeModuleTest < Test::Unit::TestCase
  def test_simple_case
    mod = RangeModule.new

    mod.add_range(10, 20)
    assert mod.query_range(14, 16)
    mod.add_range(21, 22)
    refute mod.query_range(20, 22)
    mod.add_range(20, 21)
    assert mod.query_range(20, 22)


    mod.remove_range(14, 16)
    assert mod.query_range(10, 14)
    refute mod.query_range(13, 15)
    assert mod.query_range(16, 17)
  end
end
