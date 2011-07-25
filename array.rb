# For documentation on all the array functions:
# http://www.ruby-doc.org/core/classes/Array.html

# String join using * operator with a string
# 1, 2, 3
puts [1,2,3] * ', '

# Using an int repeats instead
# [1, 2, 3, 1, 2, 3, 1, 2, 3]
puts ([1,2,3] * 3).inspect

# Can't be converted
# nil
puts Array.try_convert({ :test1 => "test" }).inspect

# Can convert a class with to_ary method
# ["Fido", "Lab"]
class Dog
  attr_accessor :name
  attr_accessor :breed
  
  def to_ary
    [@name, @breed]
  end
end
dog = Dog.new
dog.name = "Fido"
dog.breed = "Lab"
puts Array.try_convert(dog).inspect

# Combine arrays using the + operator
# [1, 2, 3, 4, 5, 6]
puts ([1,2,3] + [4,5,6]).inspect

# The - operator removes all elements in the second array from the first
# [2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20]
puts ( (1..20).to_a - [1,17,3] ).inspect

# Comparison operator is just weird...
#0
#1
#-1
# So this is equal
puts [1,2,3] <=> [1,2,3]
# Comparison goes in order and stops when it finds a value in the second array
# that is greater than or less than the current value of the first array.
# This means that the total sum of a numeric array has no bearing whatsoever
puts [1,5,7] <=> [1,3,100]
puts [1,5,7] <=> [1,7,10]

# Returns a new array ( non-destructive)
# [1, 2, 3] [1, 4, 9]
a = [1,2,3]
b = [1,2,3].map { | x | x * x }
puts a.inspect + " " + b.inspect

# Modifies array in place ( destructive)
# [1, 4, 9]
a = [1,2,3]
a.map! { | x | x * x }
puts a.inspect

# Combinations can be used to show how many ways you can combine an array
# of elements creating unique parrings. Take for example finding out how many
# passwords you could get with a length of 5 using all lowercase characters
# 65780
password_chars = ('a'..'z').to_a
puts password_chars.combination(5).to_a.length

# Hashes are fixnums that are different from object_id in that they are
# specific to the contents of the array. That means two arrays with different
# object ids but with the same contents will have the same hash.
a = [1,2,3]
b = [1,2,3]
puts a.hash.inspect + " " + b.hash.inspect

# Sample takes n number of random elements from an array, attempting to ensure
# they are unique. This can be used for a very simple random password generator
def password_generator(size)
  chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  (chars.sample(size)) * ''
end

# Example: lU2y3XTvC8SGKBPWFNI0
puts password_generator(20)

# Restricted to number of elements:
# Example: bRJ7rWdglIchEXOmao2x1H93CzAYuMnNwGsek0FyfQ4ZLBjTt6PK8pqv5SDiVU
puts password_generator(2000)

# Shuffle randomizes
# [2, "H", "t", "A", "u", "J", "C", "U", "j", 3, "i", "E", "s", "z", "S", "l", 
# "y", "O", 1, "K", 7, 0, 8, "F", "X", "e", "c", "W", "I", "p", "T", "R", "w", 
# "Q", "Y", "L", "k", "v", "n", "G", "a", "Z", 6, "d", "r", 4, "N", 9, "x", "f", 
# "h", "g", 5, "o", "m", "D", "V", "B", "M", "q", "P", "b"]
chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
shuffled_array = chars.shuffle
puts shuffled_array.inspect

# And sort restorts if possible (ie. an array with mixed types won't work
# unless you provide a custom function)
# [8, 7, 2, 6, 0, 1, 3, 5, 4, 9]
# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
shuffled_numbers = (0..9).to_a.shuffle
puts shuffled_numbers.inspect
puts shuffled_numbers.sort.inspect