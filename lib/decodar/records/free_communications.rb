module Decodar
  module Record
    class FreeCommunications < Base
      specify_identifier 4

      specify_code :cont_sequence_number, 2..5, :numeric
      specify_code :detail_number, 6..9, :numeric
      specify_code :free_communication, 32..111, :alphanumeric
      specify_code :link_code, 127, :numeric
    end
  end
end
