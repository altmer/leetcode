# hello_test.rb
require "test/unit"
require_relative './solver'

class GraphTest < Test::Unit::TestCase
  def test_edges
    graph = Graph.new([[1,0],[0,1]])
    assert_equal [0], graph.edges_from(1), "from vertex 1 must be an edge to 0"
    assert_equal [1], graph.edges_from(0), "from vertex 0 must be an edge to 1"
    assert_equal [], graph.edges_from(2), "from vertex 2 there are no edges"
  end
end
