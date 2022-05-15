require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

set :port, 1234

before do
  @barbers = Barber.order "created_at DESC"
end

get '/' do
  erb :index
end

get '/visit' do
  erb :visit
end

post '/visit' do

  c = Client.new params[:client]
  c.save

  erb "<h2>Спасибо, Вы записались!</h2>"
end
