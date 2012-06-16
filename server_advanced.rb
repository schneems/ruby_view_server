require 'erb'
require 'webrick'

root = File.expand_path 'public'

server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root

## ===========

def process_erb(string)
  template = ERB.new(string)
  return template.result(binding)
end

Dir['views/*.html.erb'].each do |file|
  content_string  = File.open(file, 'r').read
  file_name       = file.split('/').last.gsub('.html.erb', '')
  server.mount_proc "/#{file_name}" do |req, res|
    layout_string   = File.open('views/layouts/application.html.erb', 'r').read
    main_contents   = process_erb(content_string)
    res.body        = process_erb(layout_string) {main_contents}
  end
end


## ===========

trap 'INT' do server.shutdown end

server.start