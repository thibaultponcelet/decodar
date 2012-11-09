module Decodar
  module Record
    class NewBalance < Base
      specify_identifier 8

      specify_code :sequence_number, 1..3, :numeric
      specify_code :account_number_currency, 4..40, :alphanumeric
      specify_code :new_balance_sign, 41, :numeric
      specify_code :new_balance, 42..56, :numeric
      specify_code :new_balance_date, 57..62, :date
      specify_code :link_code, 127, :numeric
    end
  end
end