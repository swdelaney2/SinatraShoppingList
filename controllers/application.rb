class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :database => 'shopping',
    :adapter => 'postgresql'
  )

  # ActiveRecord::Base.establish_connection(
  #   :database => 'shopping_account',
  #   :adapter => 'postgresql'
  # )

  set :views, File.expand_path('../../views', __FILE__)
  set :public, File.expand_path('../../public', __FILE__)

  not_found do
   erb :not_found
  end

end
