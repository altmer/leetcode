class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

class MaxPath
  attr_reader :root
  def initialize(root)
    @root = root
    @res = -1001
  end

  def perform
    dfs(root)
    @res
  end

  private

  def dfs(node)
    return 0 if node.nil?

    max_left = dfs(node.left)
    max_right = dfs(node.right)

    @res = [@res, node.val + max_left + max_right].max

    [0, node.val + max_left, node.val + max_right].max
  end
end
