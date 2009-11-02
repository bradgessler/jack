require 'environment'

configure do
  Pool = Beanstalk::Pool.new(['127.0.0.1:11300'])
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

get '/tubes/:id' do
  @stats = Pool.stats_tube(params[:id])
  @tube = h(params[:id])
  haml :tube
end

get '/' do
  @stats = Pool.stats
  @tubes = Pool.list_tubes
  haml :pool
end