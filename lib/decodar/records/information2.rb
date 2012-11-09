module Decodar
  module Record
    class Information2 < Base
      specify_identifier 3, 2

      specify_code :cont_sequence_number, 2..5, :numeric
      specify_code :detail_number, 6..9, :numeric
      specify_code :ctd_communication, 10..114, :alphanumeric
      specify_code :next_code, 125, :numeric
      specify_code :link_code, 127, :numeric
    end
  end
end