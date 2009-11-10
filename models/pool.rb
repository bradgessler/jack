module Jack
  class Pool
    include DataMapper::Resource
  
    property :id, Serial
    property :host, String
  
    validates_present :host
  
    def stats
      @pool.stats
    end
  
    def tubes
      @pool.tubes
    end
  
  private
    def pool
      @pool ||= Beanstalk::Pool.new(host)
    end
  end
end