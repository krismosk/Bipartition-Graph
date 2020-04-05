def possible_bipartition(dislikes)
  colors = []
  
  graph = {}
  current_color = 0
  dislikes.each_with_index do |neighbors, node|
    if !graph[node]
      graph[node] = colors[current_color += 1]
      unless dfs(dislikes, node, painted_graph, current_color, colors)
        return false
      end
    end
  end

  return true
end

def dfs(dislikes, current_node, graph, current_color, colors)

  neighbors = dislikes[current_node]
  next_color = (current_color + 1) % colors.length

  neighbors.each do |neighbor|
    color = graph[neighbor]
    if color.nil?
      graph[neighbor] = colors[next_color]
      if !dfs(dislikes, neighbor, graph, next_color, colors)
        return false
      end
    elsif color != colors[next_color]
      return false      
    end
  end

  return true
end