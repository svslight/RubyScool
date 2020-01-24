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

	# хеш для validation - Проверка параметров на null
	hh = {
		:username => 'Введите имя', 
		:phone => 'Введите телефон', 
		:datetime => 'Введите дату и время'
	}

	# Вариант 2
	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ''
		return erb :visit
	end

	# Вариант 1
	# hh.each do |key, value|
	# 	if params[key] == ''
	# 		# переменной error присвоить value из hh - это сообщение об ошибке
	# 		@error = hh[key]

	# 		# вернуть представление visit
	# 		return erb :visit
	# 	end
	# end

	# Вариант 3
	# if is_parameters_empty? hh
	# 	return erb :visit
	# end

	erb "Ok! username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

end

# Вариант 3
# def is_parameters_empty? hh
# 	hh.each do |key, value|
# 		if params[key] == ''
# 			# переменной error присвоить value из hh - это сообщение об ошибке
# 			@error = hh[key]

# 			# вернуть представление visit
# 			return erb :visit
# 		end
# 	end
# end


get '/contacts' do
	erb :contacts
end

