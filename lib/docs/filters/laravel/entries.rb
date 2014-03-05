module Docs
  class Laravel
    class EntriesFilter < Docs::EntriesFilter

      def get_name
        at_css('h1').content
      end
      
    end
  end
end