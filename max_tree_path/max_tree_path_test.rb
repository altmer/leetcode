# hello_test.rb
require "test/unit"
require_relative './max_tree_path'

class MaxPathTest < Test::Unit::TestCase
  def test_max_path
    root = TreeNode.new(
      1,
      TreeNode.new(2, nil, nil),
      TreeNode.new(3, nil, nil)
    )
    assert_equal 6, MaxPath.new(root).perform
  end

  def test_max_path_2
    root = TreeNode.new(
      -10,
      TreeNode.new(9, nil, nil),
      TreeNode.new(
        20,
        TreeNode.new(15, nil, nil),
        TreeNode.new(7, nil, nil)
      )
    )
    assert_equal 42, MaxPath.new(root).perform
  end
end
