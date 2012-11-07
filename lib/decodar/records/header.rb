module Decodar
  module Record
    class Header < Base
      specify_identifier 0

      specify_code :creation_date         , 5..10     , :date
      specify_code :bank_id               , 11..13    , :numeric
      specify_code :application_code      , 14..15    , :numeric
      specify_code :duplicate             , 16        , :alphanumeric   , true
      specify_code :file_reference        , 24..33    , :alphanumeric   , true
      specify_code :name_addressee        , 34..59    , :alphanumeric
      specify_code :bic                   , 60..70    , :alphanumeric
      specify_code :holder_id             , 71..81    , :numeric
      specify_code :separate_application  , 83..87    , :numeric
      specify_code :transaction_reference , 88..103   , :alphanumeric   , true
      specify_code :related_reference     , 104..119  , :alphanumeric   , true
      specify_code :version               , 127       , :numeric

      def duplicate?
        duplicate == "D"
      end
    end
  end
end