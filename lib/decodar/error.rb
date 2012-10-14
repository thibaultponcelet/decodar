module Decodar
  class Error < StandardError
    UNEXPECTED_BLANK_RECORD = "The record contains an unexpect blank code"
    UNKNOWN_ACCOUNT_TYPE    = "Unknown account type"
    INVALID_DATE            = "Invalid date"

    def initialize(message, detail = "")
      super("#{message}: #{detail}")
    end
  end
end
