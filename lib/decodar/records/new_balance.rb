module Decodar
  module Record
    class NewBalance < Base
      include Helper::Amount
      include Helper::Link
      include Helper::Currency

      specify_identifier 8

      specify_code :sequence_number, 1..3, :integer
      specify_code :account_number_and_currency, 4..40, :string
      specify_code :sign, 41, :integer
      specify_code :amount, 42..56, :decimal
      specify_code :date, 57..62, :date
      specify_code :link_code, 127, :integer

      def currency
        target = account_number_and_currency
        extract_currency(target)
      end
    end
  end
end