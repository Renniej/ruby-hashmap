require_relative "hashmap"
test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "Length : #{test.length}"
puts "Set apple to LMAR"
test.set("apple", "LMAR")
puts test.get("apple")
puts "Length : #{test.length}"
puts "adding fish as nemo"
test.set("fish", "nemo")
puts test.get("fish")
puts "Length : #{test.length}"

puts "has dog? : #{test.has?("dog")}"
puts "has demigoblin? : #{test.has?("demigoblin")}"

puts "show me all the keys"
puts test.keys
puts "Length : #{test.length}"
puts "remove dog"
test.remove("dog")
puts "has dog? : #{test.has?("dog")}"
puts "Length : #{test.length}"