module Braille
  module Ko
    class Char < String
      def number?
        self.scan(/^\d+$/).any?
      end

      def char?
        self.scan(/^\D+$/).any?
      end
    end
  end
end
