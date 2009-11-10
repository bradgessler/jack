module Jack
  class Base < Sinatra::Base
    set :public, File.dirname(__FILE__) + '../public'
  end
end