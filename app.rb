require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb 'Hello all Ruby-programmers!'
end

get '/about' do
	# @error = 'something wrong!!!'
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	if @username == ''
		@error = 'Ведите имя'
		return erb :visit
	end

	erb "Ok! username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

end

get '/contacts' do
	erb :contacts
end

