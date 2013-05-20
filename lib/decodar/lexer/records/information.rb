module Decodar
  module Record
    class Information < Base
      include Helper::Link
      include Helper::TransactionRecord
    end
  end
end