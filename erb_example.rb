require 'erb'

x = 42
template = ERB.new "The value of x is: <%= x %>"
puts template.result(binding)

pets = ['Duke', 'Maggie', 'Kevin']
example1 = ERB.new "The names of my pets are : <%= pets %>"
puts example1.result

pets.each do |pet|
	puts "#{pet} is my favorite pet" 
end

example2 = ERB.new "Number of favorite pets I have : <%= pets.count %>"
puts example2.result

cat = 'Gandalf'
example3 = ERB.new "I have a cat named : <%= cat %>"
puts example3.result

pet_speak = {'cat' => 'meow', 'dog' => 'woof'}
example4 = ERB.new "<%= cat %> says <%= pet_speak ['cat'] %>"
puts example4.result