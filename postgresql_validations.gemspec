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
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "postgresql_validations"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency  'rspec',          '~>2.0'
  s.add_development_dependency  'rspec-rails'
  s.add_development_dependency  'rake'
  s.add_development_dependency  'rails',          '~>3.0'
  s.add_development_dependency  'pg'
  
end
