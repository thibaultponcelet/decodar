module Decodar
  class Transaction
    attr_reader :sequence_number, :movements

    def initialize(sequence_number)
      @sequence_number = sequence_number
      @movements         = {}
    end

    def store_record(record)
      movement_for(record.detail_number).store_record(record)
    end

    private
      def movement_for(detail_number)
        @movements[detail_number] ||= Decodar::Movement.new(detail_number)
      end
  end
end