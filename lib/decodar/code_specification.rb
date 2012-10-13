module Decodar
  class CodeSpecification
    attr_accessor :position, :type, :allow_blank

    def initialize(position, type, allow_blank)
      @position     = position
      @type         = type
      @allow_blank  = allow_blank
    end

    def apply_type(raw_code)
      if !allow_blank && raw_code.strip == ""
        raise Error.new(Error::UNEXPECTED_BLANK_RECORD, raw_code)
      end

      if type == :date
        Date.strptime(raw_code, "%y%m%d")
      else
        raw_code.strip
      end
    end
  end
end