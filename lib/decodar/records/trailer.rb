module Decodar
  module Record
    class Trailer < Base
      specify_identifier 9

      specify_code :number_of_records, 16..21, :numeric
      specify_code :debit_movement, 22..36, :numeric
      specify_code :credit_movement, 37..51, :numeric
      specify_code :multiple_file_code, 127, :numeric
    end
  end
end