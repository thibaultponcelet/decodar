module Decodar
  module Record
    class Movement2 < Movement
      specify_identifier 2, 2

      specify_code :sequence_number, 2..5, :integer
      specify_code :detail_number, 6..9, :integer
      specify_code :raw_communication, 10..62, :string, true
      specify_code :customer_reference, 63..97, :string, true
      specify_code :counterparty_bic, 98..108, :string, true
      specify_code :category_purpose, 117..120, :string, true
      specify_code :purpose, 121..124, :string,true
      specify_code :next_code, 125, :integer
      specify_code :link_code, 127, :integer
    end
  end
end