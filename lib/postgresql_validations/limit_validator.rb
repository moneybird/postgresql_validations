require 'active_model'

module PostgresqlValidations
  class LimitValidator < ActiveModel::Validator
    def validate(record)
      record.class.columns.each do |column|
        case column.type
        when :string
          next unless column.limit
          next if record[column.name].blank?

          record.errors.add(column.name, :too_long, count: column.limit) if record[column.name].to_s.length > column.limit
        end
      end
    end
  end
end
