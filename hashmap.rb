require_relative "./linked_list"

class HashMap

  def initialize() 
    @numOfEntries = 0
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def set(key,value)
    bucket = getBucket(key)
    node = bucket.findNode {| node | 

    node.value[:key]== key
  }
    if (!node.nil?) 
       node.value= {
        key: key,
        value: value, 
      }
    else
      bucket.append({
        key: key,
        value: value, 
      })
      incrementEntries()
    end
  end

  def get(key) 
    bucket = getBucket(key)
    bucket.findNode {| node | node.value[:key] == key}
  end

  def has?(key) 
    bucket = getBucket(key)
    !(bucket.findNode {| node | node.value[:key] == key}).nil?
  end

 
  def remove(key)
    bucket = getBucket(key)
    node = get(key) or return;
    node_index = bucket.find(node.value)
    node = bucket.at(node_index)
    puts "NODE INDEX #{node_index}"
    prev_node = node_index != 0 ? bucket.at(node_index - 1) : nil
    node.removeSelf(prev_node)
    decrementEntries()
  end

  def keys
    keys = []
    @buckets.each do |bucket| 
      bucket.each {|node| keys.push(node.value[:key]) } 
    end
    keys
  end


  def values
    values = []
    @buckets.each do |bucket| 
      bucket.each {|node| values.push(node.value[:value]) } 
    end
    values
  end


  def entries 
    pairs = []
  
    @buckets.each do |bucket| 
      bucket.each do |node| 
       
        key = node.value[:key]
        value = node.value[:value]
        pairs << [key,value]
      end
    end
    pairs
  end

  def length 
    @numOfEntries
  end
 
  def clear 
    @buckets.each {|bucket| bucket.clear}
  end


  private

 
  def getBucket(key) 
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    @buckets[index]
  end

  def incrementEntries
    @numOfEntries += 1
    resize()
  end

  def decrementEntries
    @numOfEntries -= 1
    resize
  end

  def resize
    return if @numOfEntries < (@capacity * @load_factor)
    oldBuckets = @buckets
    @capacity = @capacity * 2
    @buckets = Array.new(@capacity) { LinkedList.new }
    oldBuckets.each do | list |
      list.each do | node |
        set(node.value[:key], node.value[:value])
      end
    end

  end

end