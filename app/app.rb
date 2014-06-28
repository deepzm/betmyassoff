require 'sinatra'



get '/' do
  File.read(File.join('public/html', 'index.html'))
end