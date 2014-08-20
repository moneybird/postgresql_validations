require 'rubygems'
require 'bundler/setup'

require 'rails'
require 'active_record'
require 'postgresql_validations'
require 'pg'

ENV['RAILS_ENV'] = 'test'

ActiveRecord::Base.configurations = YAML.load(File.read('spec/database.yml'))
ActiveRecord::Base.establish_connection(:test)
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :cars, force: true do |table|
    table.integer  :wheels
    table.string   :brand
    table.timestamps
  end
end

RSpec.configure do |config|
  # some (optional) config here
  
end
