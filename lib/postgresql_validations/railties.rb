module PostgresqlValidations
  class Railtie < Rails::Railtie
    initializer "postgresql_validations.add_validation" do |app|
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send(:include, PostgresqlValidations::Glue)
      end
    end
  end
end