module Decodar
  class Filter
    def self.filter(files, options = {})
      files.each do |file|
        filter_file(file, options)
      end
    end

    private
      def self.filter_file(file, options = {})
        file.transactions.each do |sequence_number, transaction|
          filter_movements(file, transaction, options)
        end
        file.transactions.delete_if { |k, v| v.movements.size == 0 }
      end

      def self.filter_movements(file, transaction, options)
        transaction.movements.delete_if do |k, v| 
          (v.credit? && options[:debit_only]) ||
          (v.debit? && options[:credit_only]) ||
          (!v.credit? && !v.debit? && (options[:debit_only] || options[:credit_only])) ||
          (v.structured_communication? != options[:structured_communication])
        end
      end
  end
end