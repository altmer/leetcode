# hello_test.rb
require "test/unit"
require_relative './traversal'

class TraversalTest < Test::Unit::TestCase
  def test_traversal
    root = TreeNode.new(
      3,
      TreeNode.new(9, nil, nil),
      TreeNode.new(
        20,
        TreeNode.new(15, nil, nil),
        TreeNode.new(7, nil, nil)
      )
    )
    assert_equal [[3],[9,20],[15,7]], Traversal.new(root).perform
  end

  def test_only_root
    root = TreeNode.new(1, nil, nil)
    assert_equal [[1]], Traversal.new(root).perform
  end

  def test_nil
    assert_equal [], Traversal.new(nil).perform
  end
end
