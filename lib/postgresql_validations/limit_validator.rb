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
        when :integer
          next if record[column.name].blank?

          if column.sql_type == "bigint"
            record.errors.add(column.name, :greater_than_or_equal_to, count: -9223372036854775808) if record[column.name] < -9223372036854775808
            record.errors.add(column.name, :less_than_or_equal_to, count: 9223372036854775807) if record[column.name] > 9223372036854775807
          else
            record.errors.add(column.name, :greater_than_or_equal_to, count: -2147483648) if record[column.name] < -2147483648
            record.errors.add(column.name, :less_than_or_equal_to, count: 2147483647) if record[column.name] > 2147483647
          end
        end
      end
    end
  end

end
