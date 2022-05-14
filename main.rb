require 'sinatra'
require 'sinatra/reloader'

set :port, 1234

get '/' do
  erb "Welcome to the BarberShop!"
end
