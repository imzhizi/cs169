require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do
    "<!DOCTYPE html><html><head></head><body><h1>Hello World<br>Deploy Successfully!</h1></body></html>"
  end
end