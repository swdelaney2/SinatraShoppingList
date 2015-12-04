class AccountController < ApplicationController

  ActiveRecord::Base.establish_connection(
    :database => 'shopping_account',
    :adapter => 'postgresql'
  )


enable :sessions

# CHECK IF USERNAME ALREADY EXISTS
def does_user_exist(username)
  user = Account.find_by(:user_name => username) #Note to self -- this is not searching params, this searching the database for the :user_name column
  if user #does it exist?
    return true
  else
    return false
  end
end

# AUTHORIZATION CHECK - FOR ALL PROTECTED PAGES
def authorization_check
  if session[:current_user] == nil
    redirect '/not_authorized'
  else
    return true
  end
end

get '/register' do
  erb :register
end

post '/register' do
  # p params
  if does_user_exist(params[:user_name]) == true
    @taken = 'Sorry, that username has already been taken.'
return erb :register
    # return erb :taken
end
user = Account.create(user_email: params[:user_email], user_name: params[:user_name], password: params[:password])
# p user
session[:current_user] = user
redirect '/'
end

# get '/taken' do
#   erb :taken
# end

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

get '/error_login' do
erb :error_login
end

get '/error_register' do
  erb :error_register
end

get '/logout' do
  authorization_check
  session[:current_user] = nil
  redirect '/'
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




##DELETE?

get '/' do
  authorization_check
@user_name = session[:current_user].user_name
  @item = Item.all
  erb :index
end











  # set :views, File.expand_path('../../views', __FILE__)
  # set :public, File.expand_path('../../public', __FILE__)
  #
  # not_found do
  #  erb :not_found
  # end

end
