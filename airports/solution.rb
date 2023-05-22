flights = [
  { id: "AS001", origin: "BOL", destination: "YLK" },
  { id: "AS002", origin: "JFK", destination: "YLK" },
  { id: "AS003", origin: "BOL", destination: "JFK" }
]

class Edge
  attr_reader :id, :from, :to

  def initialize(id, origin, destination)
    @id = id
    @from = origin
    @to = destination
  end
end

class Node
  attr_reader :id, :edges

  def initialize(id)
    @id = id
    @edges = []
  end

  def add_edge(edge_id, from, to)
    @edges << Edge.new(edge_id, from, to)
  end
end

def build_graph(flights)
  graph = {}

  flights.each do |flight|
    orig = flight[:origin]

    node = graph[orig]
    if node.nil?
      node = Node.new(orig)
      graph[orig] = node
    end

    dest = flight[:destination]
    dest_node = graph[dest]
    if dest_node.nil?
      dest_node = Node.new(dest)
      graph[dest] = dest_node
    end
    node.add_edge(flight[:id], flight[:origin], flight[:destination])
  end
  graph
end

def bfs(graph, origin, destination)
  queue = [
    [graph[origin]]
  ]

  result = []

  while queue.size > 0
    current_path = queue.first
    queue.shift

    node = current_path.last

    node.edges.each do |edge|
      next if current_path.include?(edge.to)

      raise "Unknown node #{edge.to}" if graph[edge.to].nil?

      new_path = current_path + [graph[edge.to]]
      queue.push(new_path)

      if edge.to == destination
        result << new_path
      end
    end
  end

  result
end
graph = build_graph(flights)
p graph

p bfs(graph, "BOL", "YLK")
