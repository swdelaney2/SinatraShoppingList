class ItemController < ApplicationController

get '/' do
  auth_check
@user_name = session[:current_user].user_name
  @item = Item.all
  erb :index
end

get '/create' do
  erb :create
end

post '/create' do
  @item = Item.new
  @item.name = params[:name]
  @item.quantity = params[:quantity]
  @item.save
  @item = Item.all
  erb :index
end

get '/destroy/:id' do
    @item = Item.find(params[:id])
    erb :destroy
  end

  post '/destroy' do
    @item = Item.find(params[:id])
    @item.destroy
    @item = Item.all
    erb :index
  end

  #update
  get '/update/:id' do
     @item = Item.find(params[:id])
    erb :update
  end

  post '/update' do
    @item = Item.find(params[:id])
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.save
    @item = Item.all
    erb :index
  end


# ATTEMPTING TO CALL METHODS FROM ACCOUNT CLASS

  def initialize
    @instance_of_account_class = AccountController.new
  end

# Call the authorization check on the ItemController with auth_check
  def auth_check
    @AccountController.authorization_check
  end


end
