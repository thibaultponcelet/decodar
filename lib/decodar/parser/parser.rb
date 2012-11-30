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
          file.add_record(record)
          if record.is_a?(Decodar::Record::Trailer)
            files.push(file)
            file = Decodar::File.new
          end
        end
        files
      end
  end
end