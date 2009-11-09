# DO NOT MODIFY THIS FILE
module Bundler
 file = File.expand_path(__FILE__)
 dir = File.dirname(file)

  ENV["PATH"]     = "#{dir}/../../bin:#{ENV["PATH"]}"
  ENV["RUBYOPT"]  = "-r#{file} #{ENV["RUBYOPT"]}"

  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/beanstalk-client-1.0.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/beanstalk-client-1.0.2/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/data_objects-0.10.0/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/data_objects-0.10.0/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/haml-2.2.13/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/haml-2.2.13/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/dm-validations-0.10.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/dm-validations-0.10.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/addressable-2.1.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/addressable-2.1.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rack-1.0.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rack-1.0.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/dm-core-0.10.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/dm-core-0.10.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/sinatra-0.9.4/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/sinatra-0.9.4/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/extlib-0.9.13/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/extlib-0.9.13/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/do_sqlite3-0.10.0/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/do_sqlite3-0.10.0/lib")

  @gemfile = "#{dir}/../../Gemfile"

  require "rubygems"

  @bundled_specs = {}
  @bundled_specs["beanstalk-client"] = eval(File.read("#{dir}/specifications/beanstalk-client-1.0.2.gemspec"))
  @bundled_specs["beanstalk-client"].loaded_from = "#{dir}/specifications/beanstalk-client-1.0.2.gemspec"
  @bundled_specs["dm-validations"] = eval(File.read("#{dir}/specifications/dm-validations-0.10.1.gemspec"))
  @bundled_specs["dm-validations"].loaded_from = "#{dir}/specifications/dm-validations-0.10.1.gemspec"
  @bundled_specs["haml"] = eval(File.read("#{dir}/specifications/haml-2.2.13.gemspec"))
  @bundled_specs["haml"].loaded_from = "#{dir}/specifications/haml-2.2.13.gemspec"
  @bundled_specs["data_objects"] = eval(File.read("#{dir}/specifications/data_objects-0.10.0.gemspec"))
  @bundled_specs["data_objects"].loaded_from = "#{dir}/specifications/data_objects-0.10.0.gemspec"
  @bundled_specs["addressable"] = eval(File.read("#{dir}/specifications/addressable-2.1.1.gemspec"))
  @bundled_specs["addressable"].loaded_from = "#{dir}/specifications/addressable-2.1.1.gemspec"
  @bundled_specs["dm-core"] = eval(File.read("#{dir}/specifications/dm-core-0.10.1.gemspec"))
  @bundled_specs["dm-core"].loaded_from = "#{dir}/specifications/dm-core-0.10.1.gemspec"
  @bundled_specs["rack"] = eval(File.read("#{dir}/specifications/rack-1.0.1.gemspec"))
  @bundled_specs["rack"].loaded_from = "#{dir}/specifications/rack-1.0.1.gemspec"
  @bundled_specs["sinatra"] = eval(File.read("#{dir}/specifications/sinatra-0.9.4.gemspec"))
  @bundled_specs["sinatra"].loaded_from = "#{dir}/specifications/sinatra-0.9.4.gemspec"
  @bundled_specs["extlib"] = eval(File.read("#{dir}/specifications/extlib-0.9.13.gemspec"))
  @bundled_specs["extlib"].loaded_from = "#{dir}/specifications/extlib-0.9.13.gemspec"
  @bundled_specs["do_sqlite3"] = eval(File.read("#{dir}/specifications/do_sqlite3-0.10.0.gemspec"))
  @bundled_specs["do_sqlite3"].loaded_from = "#{dir}/specifications/do_sqlite3-0.10.0.gemspec"

  def self.add_specs_to_loaded_specs
    Gem.loaded_specs.merge! @bundled_specs
  end

  def self.add_specs_to_index
    @bundled_specs.each do |name, spec|
      Gem.source_index.add_spec spec
    end
  end

  add_specs_to_loaded_specs
  add_specs_to_index

  def self.require_env(env = nil)
    context = Class.new do
      def initialize(env) @env = env && env.to_s ; end
      def method_missing(*) ; end
      def only(env)
        old, @only = @only, _combine_onlys(env)
        yield
        @only = old
      end
      def except(env)
        old, @except = @except, _combine_excepts(env)
        yield
        @except = old
      end
      def gem(name, *args)
        opt = args.last || {}
        only = _combine_onlys(opt[:only] || opt["only"])
        except = _combine_excepts(opt[:except] || opt["except"])
        files = opt[:require_as] || opt["require_as"] || name
        files = [files] unless files.respond_to?(:each)

        return unless !only || only.any? {|e| e == @env }
        return if except && except.any? {|e| e == @env }

        files.each { |f| require f }
        yield if block_given?
        true
      end
      private
      def _combine_onlys(only)
        return @only unless only
        only = [only].flatten.compact.uniq.map { |o| o.to_s }
        only &= @only if @only
        only
      end
      def _combine_excepts(except)
        return @except unless except
        except = [except].flatten.compact.uniq.map { |o| o.to_s }
        except |= @except if @except
        except
      end
    end
    context.new(env && env.to_s).instance_eval(File.read(@gemfile))
  end
end

module Gem
  def source_index.refresh!
    super
    Bundler.add_specs_to_index
  end
end
