require_relative "../lib/decodar"
Decodar::Parser.new("../exemple_coda2.coda").files.each do |file|
  puts "------ FILE ----------"
  puts file.creation_date
  puts file.old_balance.to_f
  puts file.new_balance.to_f
  puts file.reference
  puts file.holder_id
  puts "Duplicate? #{file.duplicate?}"
  file.transactions.each do |transaction|
    puts (" "*50) + "===== TRANSACTION: #{transaction.sequence_number} ===="
    transaction.records.each do |record|
      puts "_"*128
      puts
      puts (" "*50) + record.class.name
      puts "_"*128
      puts record
    end
  end
end
