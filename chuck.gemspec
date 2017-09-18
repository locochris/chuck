# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "chuck"
  s.version       = "1.0.0"
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["deepfryed"]
  s.summary       = %q{Debugging http proxy like CharlesProxy}
  s.description   = <<EOF
A debugging proxy like CharlesProxy written in plain Ruby. You can intercept requests, redirect or rewrite them using simple callbacks.
EOF
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'eventmachine', '0.12.10'
  s.add_runtime_dependency 'em-websocket', '0.3.8'
  s.add_runtime_dependency 'em-http-request', '0.3.0'
  s.add_runtime_dependency 'http-parser-lite', '0.5.1'
  s.add_runtime_dependency 'thin', '1.4.1'
  s.add_runtime_dependency 'sinatra', '1.3.2'
  s.add_runtime_dependency 'foreman', '0.53.0'
  s.add_runtime_dependency 'yajl-ruby', '1.1.0'
  s.add_runtime_dependency 'swift', '1.0.1'
  # s.add_runtime_dependency 'swift-db-sqlite3', '0.1.2'
  s.add_runtime_dependency 'swift-db-postgres', '0.3.1'
  s.add_runtime_dependency 'haml', '3.1.6'
  s.add_runtime_dependency 'rdiscount', '1.6.8'

  s.add_runtime_dependency 'dotenv' # TODO find better way to load env
end
