
module Decodar
  module Record
    class Information1 < Information
      specify_identifier 3, 1

      specify_code :sequence_number, 2..5, :integer
      specify_code :detail_number, 6..9, :integer
      specify_code :reference_number, 10..30, :string
      specify_code :transaction_code, 31..38, :integer
      specify_code :communication_type, 39, :integer
      specify_code :raw_communication, 40..112, :string
      specify_code :next_code, 125, :integer
      specify_code :link_code, 127, :integer
    end
  end
end