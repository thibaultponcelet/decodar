module Decodar
  module Record
    class Movement1 < Base
      include Helper::Amount
      include Helper::Link

      specify_identifier 2, 1

      specify_code :sequence_number               , 2..5    , :integer
      specify_code :detail_number, 6..9, :integer
      specify_code :bank_reference_number, 10..30, :string, true
      specify_code :sign, 31, :integer
      specify_code :amount, 32..46, :decimal
      specify_code :value_date, 47..52, :date
      specify_code :transaction_code, 53..60, :integer
      specify_code :communication_type, 61, :integer
      specify_code :raw_communication, 62..114, :string, true
      specify_code :entry_date, 115..120, :date
      specify_code :statement_sequence_number, 121..123, :integer
      specify_code :globalisation_code, 124, :integer
      specify_code :next_code, 125, :integer
      specify_code :link_code, 127, :integer
    end
  end
end