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

  @username = params[:user_name]
  @phone = params[:user_phone]
  @datetime = params[:date_time]
  @barber = params[:master]
  @color = params[:color]

  c = Client.new
  c.name = @username
  c.phone = @phone
  c.datestamp = @datetime
  c.barber = @barber
  c.color = @color
  c.save

  erb "<h2>Спасибо, Вы записались!</h2>"
end
