require_relative "../lib/decodar"

raw_old_balance = "10001435000000080 EUR0BE                  0000000000000000061206Testgebruiker21           KBC-Bedrijfsrekening               001"
old_balance     = Decodar::Record::OldBalance.new(raw_old_balance)
puts old_balance
