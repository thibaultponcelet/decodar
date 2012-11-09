
module Decodar
  module Record
    class Information1 < Base
      specify_identifier 3, 1

      specify_code :cont_sequence_number, 2..5, :numeric
      specify_code :detail_number, 6..9, :numeric
      specify_code :reference_number, 10..30, :alphanumeric
      specify_code :transaction_code, 31..38, :numeric
      specify_code :communication_structure, 39, :numeric
      specify_code :communication, 40..112, :alphanumeric
      specify_code :next_code, 125, :numeric
      specify_code :link_code, 127, :numeric
    end
  end
end