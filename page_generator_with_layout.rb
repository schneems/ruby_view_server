require 'erb'


def process_erb(string)
  template = ERB.new string
  return template.result(binding)
end

Dir['views/*.html.erb'].each do |file|
  view_string  = File.open(file, 'r').read
  file_name       = file.split('/').last.gsub('html.erb', 'html')
  output_file     = "public/#{file_name}"
  main_contents   = process_erb(view_string)

  layout_string   = File.open('views/layouts/application.html.erb', 'r').read

  contents_with_layout = process_erb(layout_string) {main_contents}
  File.open(output_file, 'w') do |f|
    f.write(contents_with_layout)
  end
end

