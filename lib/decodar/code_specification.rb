module Decodar
  class CodeSpecification
    attr_accessor :position, :type, :allow_blank

    def initialize(position, type, allow_blank)
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
          raise Error.new(Error::UNEXPECTED_BLANK_RECORD, raw_code)
        end

        if type == :date
          begin
            Date.strptime(raw_code, "%y%m%d")
          rescue
            raise Error.new(Error::INVALID_DATE, raw_code)
          end
        else
          raw_code.strip
        end
      end
  end
end