# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "postgresql_validations/version"

Gem::Specification.new do |s|
  s.name        = "postgresql_validations"
  s.version     = PostgresqlValidations::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Edwin Vlieg"]
  s.email       = ["e.vlieg@bluetools.nl"]
  s.homepage    = ""
  s.summary     = %q{Validations for ActiveRecord models using a PostgreSQL backend}
  s.description = %q{Provides validations for ActiveRecord models when using a PostgreSQL backend. ActiveRecord does not check for limits on string and int fields, which can cause StatementInvalid exceptions. This gem provides a LimitValidator which checks the length of the input and fails a save action when input is too long.}

  s.rubyforge_project = "postgresql_validations"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activemodel'

  s.add_development_dependency  'rspec'
  s.add_development_dependency  'rspec-rails'
  s.add_development_dependency  'rake'
  s.add_development_dependency  'rails'
  s.add_development_dependency  'pg'
  s.add_development_dependency  'json'
end
