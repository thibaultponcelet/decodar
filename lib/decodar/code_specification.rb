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

        if type == :date
          begin
            Date.strptime(raw_code, "%d%m%y")
          rescue
            raise Error.new(Error::INVALID_DATE, "#{record_type}##{name}: #{raw_code}")
          end
        else
          raw_code.strip
        end
      end
  end
end