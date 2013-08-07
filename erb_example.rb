require 'erb'

x = 42
template = ERB.new "The value of x is: <%= x %>"
puts template.result(binding)

weapons=["machette","katana","cutlas","hook"]
list=ERB.new '<ul>
				<% weapons.each do |w| %>
				<li><%= "Tried killing with #{w}." %></li>
				<% end %>
			</ul>'
puts list.result(binding)

to_pull={"head"=>"keep","fingers"=>"pull off","toes"=>"pull off"}
which=gets.chomp
which_to_pull=ERB.new '<%= "You should #{to_pull[which]} the #{which}" %>'
puts which_to_pull.result(binding)

rep=ERB.new 'Le
				<% 3.times do %>
					<%= "Shaun!" %>
					<% end %>'
puts rep.result(binding)
