class Node
  attr_reader :next_node 
  attr_accessor :value
  

  def initialize(value)
    @value = value
    @next_node = nil
  end

  def set_next_node(node)
    raise "paremeter of node must be type Node" if !node.nil? && !node.is_a?(Node) 
    @next_node = node
  end

  def removeSelf(prev_node) 
    prev_node.set_next_node(@next_node)
  end

end