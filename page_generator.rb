require 'erb'


def process_erb(string)
  template = ERB.new string
  return template.result(binding)
end

## Define a function
#  def add_thes_together(x,y)
#     return x + y
#  end

## Replace contents from a string
#  str = "i rode a plane today"
#  puts str.gsub('rode', 'bought')
#  => "i bought a plane today"


## Remove contents from a string
#  str = "i rode a plane today"
#  puts str.gsub('today', '')
#  => "i bought a plane"


## Turn a string into an array
#  str = "tigers,lions,bears,ohmy"
#  puts str.split(',')
#  ["tigers", "lions", "bears", "ohmy"]

## Get the last element from an array
#  arry = [1,2,3,4,5]
#  puts arry.last
#  => 5


## Read a file
#  File.open('file_name', 'r').read

## Write a file
#  File.open('file_name', 'w') do |f|
#    f.write('new contents')
#  end

## Iterate over all files in a directory matching a pattern
#   Dir['views/*.html.erb'].each do |file|
#     puts file`
#   end
##  Here the * character represents a wildcard

puts "================================================"
puts "=== Converting files in /views to html ========="
puts "================================================"
Dir['views/*.html.erb'].each do |file|
  puts "- Reading #{file}"

  content_string  = File.open(file, 'r').read
  file_name       = file.split('/').last.gsub('html.erb', 'html')
  output_file     = "public/#{file_name}"

  puts "  - Converting .html.erb to html"
  main_contents   = process_erb(content_string)

  puts "  - Writing #{output_file}"
  File.open(output_file, 'w') do |f|
    f.write(main_contents)
  end
end

puts "================================================"
puts "=== Done, open files in /public with browser ==="
puts "================================================"
