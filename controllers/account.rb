class AccountController < ApplicationController

get '/register' do
  erb :register
end

post '/register' do
  if does_user_exist(params[:user_name]) == true
    @taken = 'Sorry, that username has already been taken.'
return erb :register
end
user = Account.create(user_email: params[:user_email], user_name: params[:user_name], password: params[:password])
session[:current_user] = user
redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  user = Account.authenticate(params[:user_name], params[:password])
  if user #Remember, if the authenticate does not match the password, it will return nil.
    session[:current_user] = user
redirect '/'
else
  @message = 'Your password or username is incorrect.'
  erb :login
end
end

get '/error_register' do
  erb :error_register
end

get '/logout' do
  authorization_check
  session[:current_user] = nil
  erb :logged_out
end

get '/success_login' do
  erb :success_login
end

get '/success_register' do
  erb :success_register
end

get '/not_authorized' do
  erb :not_authorized
end

end
