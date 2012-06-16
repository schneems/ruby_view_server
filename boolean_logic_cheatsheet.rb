if nil
  puts "Y"
else
  puts "n"
end
# => "n"

if false
  puts "Y"
else
  puts "n"
end
# => "n"

if true
  puts "Y"
else
  puts "n"
end
# => "Y"

if ""
  puts "Y"
else
  puts "n"
end
# => "Y"

if 0
  puts "Y"
else
  puts "n"
end
# => "Y"



## Here is some help on the logic `nil?` and `empty?` methods

[].empty?   # => true
[1].empty?  # => false

"".empty?   # => true
"hi".empty? # => false

nil.nil?    # => true
[].nil?     # => false
[1].nil?    # => false

"".nil?     # => false
"hi".nil?   # => false