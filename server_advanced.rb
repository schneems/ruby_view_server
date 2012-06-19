require 'erb'
require 'webrick'

root = File.expand_path 'public'

server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root

## ===========
def process_erb(string, req = nil)
  template = ERB.new(string)
  return template.result(binding)
end

Dir['views/*.html.erb'].each do |file|
  puts "Registering file for server: #{file}"
  file_name       = file.split('/').last.gsub('.html.erb', '')
  server.mount_proc "/#{file_name}" do |req, res|
    content_string  = File.open(file, 'r').read
    @request = req
    layout_string   = File.open('views/layouts/application.html.erb', 'r').read
    main_contents   = process_erb(content_string)
    res.body        = process_erb(layout_string, req) {main_contents}
  end
end


## ===========

trap 'INT' do server.shutdown end

server.start