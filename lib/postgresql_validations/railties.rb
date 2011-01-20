require 'postgresql_validations'
require 'rails'

module PostgresqlValidations
  class Railtie < Rails::Railtie
    initializer :after_initialize do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send(:validates_with, PostgresqlValidations::LimitValidator)
      end      
    end
  end
end