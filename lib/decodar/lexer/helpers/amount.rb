module Decodar
  module Helper
    module Amount
      # This module assumes that the class including it defines a sign and a amount code
      def credit?
        sign == 0
      end

      def debit?
        !credit?
      end

      def signed_amount
        credit? ? amount : -amount
      end
    end
  end
end