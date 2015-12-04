require 'sinatra/base'

require('./controllers/application')
require('./controllers/item')
require('./controllers/account')
require('./models/item')

map('/') { run ItemController }
map('/') { run AccountController }
