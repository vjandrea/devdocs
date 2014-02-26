module Docs
  class Sqlite
    class CleanHtmlFilter < Filter
      def call
        doc
      end
    end
  end
end