module Decodar
  module Record
    class Movement3 < Base
      include Helper::Link
      include Helper::Currency

      specify_identifier 2, 3
      specify_code :cont_sequence_number, 2..5, :integer
      specify_code :detail_number, 6..9, :integer
      specify_code :counterparty_account_number_and_currency, 10..46, :string, true
      specify_code :counterparty_name, 47..82, :string, true
      specify_code :ctd_communication, 82..124, :string, true
      specify_code :next_code, 125, :integer
      specify_code :link_code, 127, :integer

      def counterparty_currency
        target = counterparty_account_number_and_currency
        extract_currency(target)
      end
    end
  end
end