module Docs
  class Laravel
    class CleanHtmlFilter < Filter

      NODES_TO_REMOVE = [
        '.toc',
        'footer',
        'nav',
        'header',
        '#copyright',
      ]

      def call
        css(*NODES_TO_REMOVE).remove

        doc
      end
    end
  end
end