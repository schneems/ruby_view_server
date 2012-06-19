require 'erb'

x = 7000
y = "Jaci "
z = "is learning Ruby"
template = ERB.new "The value of this class is: <%= y + z %>"
lineone = ERB.new "<%= y + z%>"
linetwo = ERB.new "<%= x %>"
pets = ['Clementine', 'Ande']

answer = ERB.new "Jaci does not have <%= pets.count %> pets"
test = ERB.new '
<% pets.each do |pet| %>
   <%= "I love #{pet}" %> 
<% end %>'
puts answer.result(binding)
puts test.result(binding)
puts template.result(binding)
puts lineone.result(binding)
puts linetwo.result(binding)

