module Decodar
  module Record
    class Header < Base
      specify_identifier 0

      specify_code :creation_date         , 5..10     , :date
      specify_code :bank_id               , 11..13    , :integer
      specify_code :application           , 14..15    , :integer
      specify_code :duplicate_code        , 16        , :string   , true
      specify_code :file_reference        , 24..33    , :string   , true
      specify_code :name_addressee        , 34..59    , :string
      specify_code :bic                   , 60..70    , :string
      specify_code :holder_id             , 71..81    , :integer
      specify_code :separate_application  , 83..87    , :integer
      specify_code :transaction_reference , 88..103   , :string   , true
      specify_code :related_reference     , 104..119  , :string   , true
      specify_code :version               , 127       , :integer

      def duplicate?
        duplicate_code == "D"
      end

      def store(file)
        file.header = self
      end
    end
  end
end