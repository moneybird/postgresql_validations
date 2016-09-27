require 'rubygems'
require 'bundler/setup'

require 'rails'
require 'active_record'
require 'postgresql_validations'
require 'pg'

ENV['RAILS_ENV'] = 'test'

I18n.enforce_available_locales = true

ActiveRecord::Base.configurations = YAML.load(File.read('spec/database.yml'))
ActiveRecord::Base.establish_connection(:test)
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :cars, force: true do |table|
    table.integer  :wheels
    table.string   :brand, limit: 255
    table.string   :serial_no
    table.integer  :power, limit: 8
    table.timestamps null: true
  end
end

RSpec.configure do |config|
  # some (optional) config here

end
