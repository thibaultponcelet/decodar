module Decodar
  module Record
    class Movement3 < Base
      specify_identifier 2, 3
      specify_code :cont_sequence_number, 2..5, :numeric
      specify_code :detail_number, 6..9, :numeric
      specify_code :counterparty_account_number, 10..46, :alphanumeric, true
      specify_code :counterparty_name, 47..82, :alphanumeric, true
      specify_code :ctd_communication, 82..124, :alphanumeric, true
      specify_code :next_code, 125, :numeric
      specify_code :link_code, 127, :numeric
    end
  end
end