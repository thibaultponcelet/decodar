module Decodar
  module Helper
    module Currency
      def extract_currency(target)
        target.split(" ")[1]
      end

      def extract_account_number(target)
        target.split(" ")[0]
      end
    end
  end
end