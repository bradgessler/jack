require 'vendor/gems/environment'
require 'sinatra'
require 'beanstalk-client'
require 'haml'
require 'dm-core'
require 'dm-validations'
require 'do_sqlite3'

Dir['./models/*.rb'].each do |model|
  require model
end