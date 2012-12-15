module Decodar
  module Record
    class OldBalance < Base
      include Helper::Amount
      include Helper::Currency

      specify_identifier 1

      specify_code :account_structure_code             , 1         , :integer
      specify_code :account_sequence_number       , 2..4      , :integer
      specify_code :account_number_and_currency   , 5..41     , :string
      specify_code :sign              , 42        , :integer
      specify_code :amount                   , 43..57    , :decimal
      specify_code :date              , 58..63    , :date
      specify_code :account_holder_name           , 64..89    , :string
      specify_code :account_description           , 90..124   , :string , true
      specify_code :movement_sequence_number      , 125..128  , :integer

      def store(file)
        file.old_balance = self
      end

      def account_structure # TODO  How to model ?
        if account_strucure_code     == 0
          :belgian
        elsif account_strucure_code  == 1
          :foreign
        elsif account_strucure_code  == 2
          :belgian_iban
        elsif account_strucure_code  == 3
          :foreign_iban
        else
          raise Error.new(Error::UNKNOWN_ACCOUNT_TYPE, account_strucure_code)
        end
      end

      def currency
        target = account_number_and_currency
        extract_currency(target)
      end
    end
  end
end