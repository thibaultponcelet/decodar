module Decodar
  class Communication
    attr_reader :raw_value, :value

    def initialize(movement)
      @movement  = movement
      @raw_value = extract_raw_communication
      extract_communication
    end

    #Credit transfer or cash payment with structured 12 pos N format communication
    def digit_97_cash_payment?
      @type == "101" || @type == "102"
    end

    def to_s
      @value
    end

    private 
      def extract_raw_communication
        result = ""
        @movement.records.each do |r|
          result += r.raw_communication
        end
        result
      end

      def extract_communication
        @value = @raw_value[3..-1]
        @type  = @raw_value[0..2]
      end
  end
end