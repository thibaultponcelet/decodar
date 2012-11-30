require_relative "../lib/decodar"
Decodar::Parser.new("../exemple_coda2.coda").files.each do |file|
  puts file.creation_date
  puts file.old_balance.to_f
  puts file.new_balance.to_f
  puts file.reference
  puts file.holder_id
  puts "Duplicate? #{file.duplicate?}"
end
