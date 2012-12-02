module Decodar
  class Transaction
    attr_reader :sequence_number, :records

    def initialize(sequence_number)
      @sequence_number = sequence_number
      @records         = []
    end

    def add_record(record)
      @records.push(record)
    end
  end
end