require 'bundler'
Bundler.require()

get '/' do
    erb :index
end

get '/items' do
    erb :items
end

get '/users' do
    erb :users
end

get '/sales' do
    erb :sales
end

get '/faq' do
    erb :faq
end
