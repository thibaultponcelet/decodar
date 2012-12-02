module Decodar
  class File
    attr_reader :transactions

    def initialize
      @transactions = []
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
        store_transactions(record)
      end
    end

    def creation_date
      @header.creation_date
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
      def store_transactions(record)
        if @current_transaction.nil?
          @current_transaction = Decodar::Transaction.new(record.sequence_number)
        elsif @current_transaction.sequence_number != record.sequence_number
          @transactions.push(@current_transaction)
          @current_transaction = Decodar::Transaction.new(record.sequence_number)          
        end
        @current_transaction.add_record(record)
      end
  end
end