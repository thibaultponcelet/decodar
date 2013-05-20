module Decodar
  class Movement
    attr_reader :records, :detail_number

    def initialize(detail_number)
      @detail_number   = detail_number
      @records         = []
    end

    def store_record(record)
      @records.push(record)
    end

    def credit?
      if @records.first.respond_to? :credit?
        @records.first.credit? 
      else
        false
      end
    end

    def debit?
      if @records.first.respond_to? :debit?
        @records.first.debit?
      else
        false
      end
    end

    def amount
      @records.first.signed_amount
    end

    def structured_communication?
      if @records.first.respond_to? :communication_type
        @records.first.communication_type == 1
      else
        false
      end
    end

    def value_date
      @records.first.value_date
    end

    def communication
      @communication ||= Decodar::Communication.new(self)
    end

    def counterparty_name
      record = records.find{ |r| r.respond_to? :counterparty_name }
      if record
        record.counterparty_name
      else
        ""
      end
    end

    def counterparty_account_number
      record = records.find{ |r| r.respond_to? :counterparty_account_number }
      if record
        record.counterparty_account_number
      else
        ""
      end
    end
  end
end