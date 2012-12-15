module Decodar
  module Record
    class Trailer < Base
      specify_identifier 9

      specify_code :number_of_records, 16..21, :integer
      specify_code :debit_movement, 22..36, :decimal
      specify_code :credit_movement, 37..51, :decimal
      specify_code :multiple_file_code, 127, :integer

      def store(file)
        file.trailer = self
      end

      def last_file?
        multiple_file_code == 2
      end
    end
  end
end