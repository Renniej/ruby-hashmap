require_relative "node"

class LinkedList

  first_node = nil
  last_node = nil

  def empty?
    @first_node.nil?
  end

  def head
    @first_node
  end

  def tail
    @last_node
  end


  def at(index)
    raise "parameter index expects a number" if !index.is_a?(Numeric)
    return traverse do |count, node|
      count == index
    end
  end


  def size
    count = 0
    traverse do |index,_|
      count += 1
    end
    count
  end

  def contains?(value)
    found = traverse {|_,node| node.value == value} 
    !found.nil?
  end

  def find(value)
    cur_index = 0
    found = traverse do |index, node| 
      cur_index = index
      node.value == value
    end
    (found.nil?) ? nil : cur_index
  end

  def each(&block)
    traverse do |_, node|
      block.call(node)
    end
  end

  def clear
    @first_node = nil
    @last_node = nil
  end

  def findNode(&block) 
    traverse do |index, node| 
      &block.call(node)
    end
  end

  def pop
    removed_node = @last_node
    second_last_node = at((size) -2)
    second_last_node.set_next_node(nil)
    @last_node = second_last_node
    removed_node
  end

  def to_s 
    output = ""
    traverse { | _, node |  output += "( #{node.value} ) -> " }
    output += "nil"
    output
  end

  def append(value)
    node = Node.new(value)
    if empty?
       @first_node = node
    elsif size == 1 #only 2 elements are in the list atm
        @last_node = node
        @first_node.set_next_node(node)
    else
        @last_node.set_next_node(node)
        @last_node = node
    end
  end



  def prepend(value)
    node = Node.new(value)
    if empty?
       @first_node = node
    elsif size == 1  #only 2 elements are in the list atm
        node.set_next_node(@first_node)
        @last_node = @first_node
        @first_node = node
    else
      node.set_next_node(@first_node)
      @first_node = node
    end
  end


  private
  def traverse(&block) 
    cur_node = @first_node
    index = 0
    while cur_node
      break if block.call(index, cur_node) === true
      cur_node = cur_node.next_node
      index += 1
    end
    cur_node
  end


end