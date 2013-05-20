module Decodar
  module Record
    class Movement < Base
      include Helper::Link
      include Helper::TransactionRecord
    end
  end
end