class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Traversal
  attr_reader :root, :levels

  def initialize(root)
    @root = root
    @levels = []
  end

  def perform
    dfs(root, 0)
    @levels
  end

  private

  def dfs(node, level_index)
    return if node.nil?

    if level_index == @levels.size
      @levels << []
    end

    @levels[level_index] << node.val

    dfs(node.left, level_index + 1)
    dfs(node.right, level_index + 1)
  end
end