module Decodar
  module Record
    class Information3 < Base
      specify_identifier 3, 3
      specify_code :cont_sequence_number, 2..5, :numeric
      specify_code :detail_number, 6..9, :numeric
      specify_code :ctd_communication, 10..99, :alphanumeric
      specify_code :next_code, 125, :numeric
      specify_code :link_code, 127, :numeric
    end
  end
end