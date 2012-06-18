require 'erb'


def process_erb(string)
  template = ERB.new string
  return template.result(binding)
end

puts "============================================================"
puts "=== Converting files in /views to html with layout ========="
puts "============================================================"

Dir['views/*.html.erb'].each do |file|
  puts "- Reading #{file}"

  view_string  = File.open(file, 'r').read
  file_name       = file.split('/').last.gsub('html.erb', 'html')
  output_file     = "public/#{file_name}"
  main_contents   = process_erb(view_string)

  layout_string   = File.open('views/layouts/application.html.erb', 'r').read

  puts "  - Converting .html.erb to html with Layout !!!"
  contents_with_layout = process_erb(layout_string) {main_contents}

  puts "  - Writing #{output_file}"
  File.open(output_file, 'w') do |f|
    f.write(contents_with_layout)
  end
end

puts "============================================================"
puts "=== Done, open files in /public with browser ==============="
puts "============================================================"