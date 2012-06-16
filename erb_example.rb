require 'erb'

x = 42
template = ERB.new "The value of x is: <%= x %>"
puts template.result(binding)