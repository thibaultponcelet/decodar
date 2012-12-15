module Decodar
  class File
    attr_reader :transactions
    attr_accessor :header, :new_balance, :old_balance, :trailer

    def initialize
      @transactions = {}
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

    def store_transaction_record(record)
      transaction = transaction_for(record.sequence_number)
      transaction.store_record(record)
    end

    private
      def transaction_for(sequence_number)
        transactions[sequence_number] ||= Decodar::Transaction.new(sequence_number)
      end
  end
end