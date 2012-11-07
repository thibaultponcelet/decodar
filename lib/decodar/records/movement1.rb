module Decodar
  module Record
    class Movement1 < Base
      specify_identifier 2, 1

      specify_code :sequence_number               , 2..5    , :numeric
      specify_code :detail_number, 6..9, :numeric
      specify_code :bank_reference_number, 10..30, :alphanumeric, true
      specify_code :movement_sign, 31, :numeric
      specify_code :amount, 32..46, :numeric
      specify_code :value_date, 47..52, :date
      specify_code :transaction_code, 53..60, :numeric
      specify_code :communication_type, 61, :numeric
      specify_code :raw_communication, 62..114, :alphanumeric, true
      specify_code :entry_date, 115..120, :date
      specify_code :statement_sequence_number, 121..123, :numeric
      specify_code :globalisation_code, 124, :numeric
      specify_code :next_code, 125, :numeric
      specify_code :link_code, 127, :numeric
    end
  end
end