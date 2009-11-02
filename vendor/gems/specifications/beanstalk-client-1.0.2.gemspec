# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{beanstalk-client}
  s.version = "1.0.2"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Keith Rarick"]
  s.cert_chain = nil
  s.date = %q{2008-06-18}
  s.description = %q{Ruby client library for the Beanstalk protocol}
  s.email = %q{kr@causes.com}
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/beanstalk-client.rb", "lib/beanstalk-client/connection.rb", "lib/beanstalk-client/errors.rb", "lib/beanstalk-client/job.rb", "lib/beanstalk-client/version.rb", "log/debug.log", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_beanstalk-client.rb", "test/test_helper.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.rhtml"]
  s.homepage = %q{http://beanstalk.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{beanstalk}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby client library for the Beanstalk protocol}
  s.test_files = ["test/test_beanstalk-client.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
