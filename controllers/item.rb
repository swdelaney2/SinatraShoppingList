class ItemController < ApplicationController

get '/' do
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


end
