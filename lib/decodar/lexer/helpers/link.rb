module Decodar
  module Helper
    module Link
      # This module assumes that the class including it defines a link code
      def linked?
        link_code == 1
      end
    end
  end
end