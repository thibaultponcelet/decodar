module Decodar
  module Record
    class OldBalance < Base
      specify_identifier 1

      specify_code :account_structure             , 1         , :numeric
      specify_code :account_sequence_number       , 2..4      , :numeric
      specify_code :account_number_and_currency   , 5..41     , :alphanumeric
      specify_code :old_balance_sign              , 42        , :numeric
      specify_code :old_balance                   , 43..57    , :numeric
      specify_code :old_balance_date              , 58..63    , :date
      specify_code :account_holder_name           , 64..89    , :alphanumeric
      specify_code :account_description           , 90..124   , :alphanumeric , true
      specify_code :movement_sequence_number      , 125..128  , :numeric

      def account_type # TODO  How to model ?
        if account_strucure     == "0"
          :belgian
        elsif account_strucure  == "1"
          :foreign
        elsif account_strucure  == "2"
          :belgian_iban
        elsif account_strucure  == "3"
          :foreign_iban
        else
          raise Error.new(Error::UNKNOWN_ACCOUNT_TYPE, account_strucure)
        end
      end
    end
  end
end