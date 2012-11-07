module Decodar
  module Record
    class Movement2 < Base
      specify_identifier 2, 2

      specify_code :cont_sequence_number, 2..5, :numeric
      specify_code :detail_number, 6..9, :numeric
      specify_code :ctd_communication, 10..62, :alphanumeric, true
      specify_code :customer_reference, 63..97, :alphanumeric, true
      specify_code :counterparty_bic, 98..108, :alphanumeric, true
      specify_code :category_purpose, 117..120, :alphanumeric, true
      specify_code :purpose, 121..124, :alphanumeric,true
      specify_code :next_code, 125, :numeric
      specify_code :link_code, 127, :numeric
    end
  end
end