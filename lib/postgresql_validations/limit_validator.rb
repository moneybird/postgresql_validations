require 'active_model'

module PostgresqlValidations
  class LimitValidator < ActiveModel::Validator
    def validate(record)
      record.class.columns.each do |column|
        case column.type
        when :string
          next if record[column.name].blank?
          column_limit = column.limit || 255
          record.errors.add(column.name, :too_long, count: column.limit) if record[column.name].to_s.length > column_limit
        end
      end
    end
  end
end
