module Jack
  class Pools < Jack::Base
    configure do
      DataMapper.setup(:default, 'sqlite3::memory:')
      DataMapper.auto_migrate!
      # Pool = Beanstalk::Pool.new(['127.0.0.1:11300'])
    end
    
    helpers do
      def h(val)
        Rack::Utils.escape_html(val)
      end
    end
    
    get '/stylesheet.css' do
      header 'Content-Type' => 'text/css; charset=utf-8'
      sass :stylesheet
    end
    
    get '/new' do
      @pool = Pool.new
      haml :new
    end
    
    post '/' do
      @pool = Pool.new(params)
      
      if @pool.save
        redirect "/"
      else
        haml :new
      end
    end
    
    get '/' do
      @pools = Pool.all
      haml :index
    end
  end
end