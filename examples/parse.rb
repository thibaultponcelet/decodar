require_relative "../lib/decodar"
files = Decodar::Parser.new(ARGV[0]||"../exemple_coda2.coda").files

Decodar::Filter.filter(files, :credit_only => true, :structured_communication => true).each do |file|
  puts "------ FILE ----------"
  puts file.creation_date
  puts file.old_balance.to_f
  puts file.new_balance.to_f
  puts file.reference
  puts file.holder_id
  puts "Duplicate? #{file.duplicate?}"
  file.transactions.values.each do |transaction|
    puts (" "*50) + "===== TRANSACTION: #{transaction.sequence_number} ===="
    transaction.movements.values.each do |movement|
      puts "Date: "+movement.value_date.to_s
      puts "Communication: "+movement.communication.to_s
      puts "Counterparty name: "+movement.counterparty_name.to_s
      puts "Counterparty account number: "+movement.counterparty_account_number.to_s
      puts "Amount: "+movement.amount.to_s("F")
      movement.records.each do |record|
        puts "_"*128
        puts
        puts (" "*50) + record.class.name
        puts "_"*128
        puts record
      end
    end
  end
end
