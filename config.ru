require 'sinatra/base'

require('./controllers/application')
require('./controllers/item')
require('./controllers/account')
require('./models/item')
require('./models/account')


map('/') { run ItemController }
map('/account') { run AccountController }
