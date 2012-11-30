module Decodar
  module Record
    class FreeCommunications < Base
      include Helper::Link

      specify_identifier 4

      specify_code :cont_sequence_number, 2..5, :integer
      specify_code :detail_number, 6..9, :integer
      specify_code :free_communication, 32..111, :string
      specify_code :link_code, 127, :integer
    end
  end
end
