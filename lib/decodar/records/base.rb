module Decodar
  module Record
    class Base
      class << self
        attr_accessor :specified_codes
      end

      def self.inherited(base)
        base.instance_eval do
          @specified_codes = {}
        end
      end

      def self.specify_code(name, position, type, allow_blank = false)
        code_reader(name)
        @specified_codes[name] = CodeSpecification.new(position, type, allow_blank)
      end

      def self.code_reader(name)
        define_method(name) do
          @codes[name]
        end
      end

      def initialize(raw_record)
        @codes      = {}
        @raw_record = raw_record
        read
      end

      def to_s
        result = ""
        @codes.each do |k, v|
          result << ":#{k} => #{v.inspect}\n"
        end
        result
      end

      private
        def read
          self.class.specified_codes.each do |name, specification|
            @codes[name] = specification.extract_formatted_code(@raw_record)
          end
        end
      end
  end
end