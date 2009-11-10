require 'vendor/gems/environment'
require 'sinatra'
require 'beanstalk-client'
require 'haml'
require 'dm-core'
require 'dm-validations'
require 'do_sqlite3'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each do |model|
  require model
end

require 'apps/base'
Dir[File.dirname(__FILE__) + '/apps/*/*.rb'].each do |app|
  require app
end