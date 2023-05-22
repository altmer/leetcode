class Graph
  def initialize(edges)
    @adjacency_lists = {}

    edges.each do |edge|
      from, to = edge
      list = @adjacency_lists[from] || []
      list << to
      @adjacency_lists[from] = list
    end
  end

  def edges_from(vertex)
    @adjacency_lists[vertex] || []
  end
end

class CourseScheduler
  attr_reader :num

  def initialize(num, prereqs)
    @num = num
    @graph = Graph.new(prereqs)
  end

  def doable?
    visited = Array.new(num)
    for vertex in 0..num-1
      next if visited[vertex]

      if dfs(vertex, visited, Array.new(num))
        return false
      end
    end
    true
  end

  private

  def dfs(current, visited, seen)
    # p "DFS RUN"
    # p current
    # p visited
    # p seen
    visited[current] = true
    seen[current] = true

    @graph.edges_from(current).each do |dest|
      if seen[dest]
        return true
      end

      next if visited[dest]

      if dfs(dest, visited, seen)
        return true
      end
    end

    seen[current] = false
    false
  end
end
