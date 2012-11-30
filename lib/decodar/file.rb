module Decodar
  class File
    def initialize
      @records = []
    end

    def add_record(record)
      if record.is_a?(Decodar::Record::Header)
        @header = record
      elsif record.is_a?(Decodar::Record::OldBalance)
        @old_balance = record
      elsif record.is_a?(Decodar::Record::NewBalance)
        @new_balance = record
      elsif record.is_a?(Decodar::Record::Trailer)
        @trailer = record
      else  
        @records.push(record)
      end
    end

    def creation_date
      @header.creation_date
    end

    def transactions
      @transactions ||= extract_transactions
    end

    def old_balance
      @old_balance.signed_amount
    end

    def new_balance
      @new_balance.signed_amount
    end

    def duplicate?
      @header.duplicate?
    end

    def reference
      @header.file_reference.to_i
    end

    def holder_id
     @header.holder_id.to_i
    end

    private
      def extract_transactions
        #todo
      end
  end
end