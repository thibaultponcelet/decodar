module Decodar
  module Helper
    module Currency
      def extract_currency(target)
        target[target.size-3..target.size]
      end
    end
  end
end