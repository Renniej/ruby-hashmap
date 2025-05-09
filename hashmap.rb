=begin
Hash {

  create property of type number called load_factor with the initial value of 0.75
  create property of type number called capacity with the initial value of 16
  create property of type array<LinkedList> called buckets with the initial value of empty nil list

  hash(key : String)  
    create variable of type number called hash_code with the initial value of 0
    create variable of type number called prime_number with the initial value of 31
    for each character in key
        set hash_code to prime_number * hash_code + ( result of convert char to ascii value )
    end
  end


  set(key, value) 
    create a variable of type number called index with the initial value of hash(key) % capacity
    create a variable called bucket with the initial value of buckets[index]
    
    if bucket is empty then
      set buckets[index] to a new node(key, value)
    else
      for each node in bucket
        create a variable called entry with the initial value of node's value property
        if entry's key is equal to key then 
          set the value to value and return the function
        end
      end
      append a new node(key,value) to the end of the linkedlist 
    end
  end

  get(key)
    


}  


=end
