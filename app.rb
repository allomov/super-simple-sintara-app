require 'rubygems'
require 'sinatra'

get '/' do
  host = ENV['VCAP_APP_HOST']
  port = ENV['VCAP_APP_PORT']
  <<-EOS
  <h3>Sinatra Test app for CF Vagrant Installer</h3>
      Hello from #{host}:#{port}! <br/>
  EOS
end

get '/env' do
  ENV.to_a.map { |e| "<br><b>#{e.first}</b>: #{e.last}</br>" }.join("\n")
end

get '/instance-index' do
  instance_index = ENV['CF_INSTANCE_INDEX']
  "<link href='/css/application.css' rel='stylesheet' type='text/css'>" + 
  "<div class='label'>Index number</div>" +
  "<div class='index'>#{instance_index}</div>"
end
