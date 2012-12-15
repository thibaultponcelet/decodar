module Decodar
  class Parser
    attr_reader :files

    def initialize(filepath)
      @filepath = filepath
      parse
    end

    private
      def parse
        @records = Decodar::Lexer.instance.analyze(@filepath)
        @files  = extract_files 
      end

      def extract_files
        files = []
        file = Decodar::File.new
        @records.each do |record|
          validate_record(record)
          record.store(file)
          if record.is_a?(Decodar::Record::Trailer)
            files.push(file)
            file = Decodar::File.new
          end
        end
        files
      end

      def validate_record(record)
        # TODO
        #
        # The ‘next’ code (pos 126) shows whether or not there is a part 2 and/or 3 in the record.
        # In a record 21, pos 126 will be 1 when it is followed by a record 22 or 23, and 0 when no record 22 or 23 is following.
        # In a record 22, pos 126 will be 1 when it is followed by a record 23, and 0 when no record 23 is following.
        # In a record 23, pos 126 always will be 0.
        # In a record 31, pos 126 will be 1 when it is followed by a record 32, and 0 when no record 32 is following.
        # In a record 32, pos 126 will be 1 when it is followed by a record 33, and 0 when no record 33 is following.
        # In a record 33, pos 126 always will be 0.
        #
        # The ‘link’ code (pos 128) shows if there is any following record.
        # In a record 21, 22, 23, 31, 32 or 33, pos 128 will be 1 when it is followed by a record, and 0 when no record 31 is following.
      end
  end
end

