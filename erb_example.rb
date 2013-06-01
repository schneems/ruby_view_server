require 'erb'

x = 42
template = ERB.new "The value of x is: <%= x %>"
puts template.result(binding)

# => my code:
my_info_hash = {
                  first_name: "Herminio",
                  last_name: "Torres",
                  age: 29,
                  like: "programming with ruby!"
               }

my_html = <<-HTML
  <ul>
    <% my_info_hash.each do |key, value| %>
      <li><%= key %>: <%= value %></li>
    <% end %>
  </ul>
HTML

template = ERB.new(my_html)
puts template.result(binding)

my_info_array = [1,2,3,4,5]

my_html = <<-HTML
  <% my_info_array.each do |num| %>
    <p><%= num * num %></p>
  <% end %>
HTML

template = ERB.new(my_html)
puts template.result(binding)

p x = 42
template = ERB.new <<-HTML
  <% if x%2==0 %>
    <%= "The value of is par" %>
  <% else %>
    <%= "The value of is not par" %>
  <% end %>
HTML
puts template.result(binding)
