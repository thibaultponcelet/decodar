module Decodar
  class CodeSpecification
    attr_accessor :record_type, :name, :position, :type, :allow_blank

    def initialize(record_type, name, position, type, allow_blank)
      @record_type  = record_type
      @name         = name
      @position     = position
      @type         = type
      @allow_blank  = allow_blank
    end

    def extract_formatted_code(raw_record)
      raw_code = raw_record[position]
      cast(raw_code)
    end

    private
      def cast(raw_code)
        if !allow_blank && raw_code.strip == ""
          raise Error.new(Error::UNEXPECTED_BLANK_RECORD, "#{record_type}##{name} at #{position}")
        end

        if type == :integer
          format_integer(raw_code)
        elsif type == :string
          format_string(raw_code)
        elsif type == :decimal
          format_decimal(raw_code)
        elsif type == :date
          format_date(raw_code)
        else
          raise Error.new(Error::INVALID_TYPE, "#{record_type}##{name}: #{type}")
        end
      end

      def format_integer(raw_code)
        raw_code.to_i
      end

      def format_string(raw_code)
        raw_code.strip
      end

      def format_decimal(raw_code)
        BigDecimal.new("#{raw_code[0..11].to_i}.#{raw_code[12..14]}")
      end

      def format_date(raw_code)
        begin
          Date.strptime(raw_code, "%d%m%y")
        rescue
          raise Error.new(Error::INVALID_DATE, "#{record_type}##{name}: #{raw_code}")
        end
      end
  end
end