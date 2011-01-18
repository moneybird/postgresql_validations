require 'postgresql_validations'
require 'rails'
require 'postgresql_validations/railties'
require 'postgresql_validations/validator'

module PostgresqlValidations
  
  module Glue
    def self.included base #:nodoc:
      validates_with PostgresqlValidations::Validator
    end
  end

end
