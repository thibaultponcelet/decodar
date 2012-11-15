require "date"
require "singleton"
require 'bigdecimal'

# Version
require_relative "./decodar/version.rb"

#Error
require_relative "./decodar/error.rb"

# Parser
require_relative "./decodar/parser.rb"

# Code specification
require_relative "./decodar/code_specification.rb"

# Helpers
require_relative "./decodar/helpers/amount.rb"
require_relative "./decodar/helpers/link.rb"
require_relative "./decodar/helpers/currency.rb"

# Records
require_relative "./decodar/records/base.rb"
require_relative "./decodar/records/header.rb"
require_relative "./decodar/records/old_balance.rb"
require_relative "./decodar/records/movement1.rb"
require_relative "./decodar/records/movement2.rb"
require_relative "./decodar/records/movement3.rb"
require_relative "./decodar/records/information1.rb"
require_relative "./decodar/records/information2.rb"
require_relative "./decodar/records/information3.rb"
require_relative "./decodar/records/new_balance.rb"
require_relative "./decodar/records/free_communications.rb"
require_relative "./decodar/records/trailer.rb"