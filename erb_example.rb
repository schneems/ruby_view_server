require 'erb'

x = 42
y = {name: "Huygens", age: 28, fav_quote: "We are what we think"}

template = ERB.new "The value of x is: <%= x %>"
block1 = ERB.new "Your name is <%= y[:name] %>"
block2 = ERB.new "If you were born in 1984, you would be <%= #{2012-1984} %> yrs old"
block3 = ERB.new("Hey Mr. <%= y[:name] %>. At <%= y[:age] %>, its good to have <%= y[:fav_quote] %> as your favorite quote")
#template2 = ERB.new("The number is greater than 40 <% if x>40 %>")
puts template.result(binding)
puts block1.result(binding)
puts block2.result(binding)
puts block3.result(binding)
#puts template2.result(binding)
