class ItemController < ApplicationController


get '/' do
  authorization_check
@user_name = session[:current_user].user_name
  @item = Item.all
  erb :index
end

get '/create' do
  authorization_check
  erb :create
end

post '/create' do
  @item = Item.new
  @item.name = params[:name]
  @item.quantity = params[:quantity]
  @item.save
  @item = Item.all
  @user_name = session[:current_user].user_name

  erb :index
end

get '/destroy/:id' do
  authorization_check
    @item = Item.find(params[:id])
    erb :destroy
  end

  post '/destroy' do
    @item = Item.find(params[:id])
    @item.destroy
    @item = Item.all
    @user_name = session[:current_user].user_name

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
    @user_name = session[:current_user].user_name

    erb :index
  end

end
