module Decodar
  module Record
    class Information2 < Information
      specify_identifier 3, 2

      specify_code :sequence_number, 2..5, :integer
      specify_code :detail_number, 6..9, :integer
      specify_code :raw_communication, 10..114, :string
      specify_code :next_code, 125, :integer
      specify_code :link_code, 127, :integer
    end
  end
end