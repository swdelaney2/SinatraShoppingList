class AccountController < Sinatra::Base
  require 'bundler'
  Bundler.require

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



get '/error_login' do
erb :error_login
end

get '/error_register' do
  erb :error_register
end

get '/login' do
  erb :login
end

get '/register' do
  erb :register
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
















  # set :views, File.expand_path('../../views', __FILE__)
  # set :public, File.expand_path('../../public', __FILE__)
  #
  # not_found do
  #  erb :not_found
  # end

end
