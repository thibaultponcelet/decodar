module Decodar
  class Error < StandardError
    UNEXPECTED_BLANK_RECORD = "The record contains an unexpect blank code"

    def initialize(message, detail = "")
      super("#{message}: #{detail}")
    end
  end
end
