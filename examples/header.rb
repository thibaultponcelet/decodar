require_relative "../lib/decodar"

raw_header = "0000006120672505        00099449  Testgebruiker21           KREDBEBB   00630366277 00000                                       2"
header     = Decodar::Record::Header.new(raw_header)
puts header
puts header.bic
