module Decodar
  module Helper
    module TransactionRecord
      def store(file)
        file.store_transaction_record(self)
      end
    end
  end
end