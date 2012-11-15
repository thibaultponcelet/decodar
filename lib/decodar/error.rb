module Decodar
  class Error < StandardError
    UNEXPECTED_BLANK_RECORD = "The record contains an unexpect blank code"
    UNKNOWN_ACCOUNT_TYPE    = "Unknown account type"
    INVALID_DATE            = "Invalid date"
    INVALID_TYPE            = "Invalid type specified"
    VERSION_MISMATCH        = "This file does not use the appropriate CODA version:"

    def initialize(message, *args)
      super("#{message}: #{args.join(" ")}")
    end
  end
end
