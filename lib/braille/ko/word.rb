#encoding: utf-8
module Braille
  module Ko
    class Word
      attr_reader :word
      
      def initialize(word)
        @word = word
      end

      def translate
        if GROUPS.has_key?(@word)
          GROUPS[@word]
        else
          syllables = @word.scan(/[가-힣]/)
          syllables.map {|s| Jaso.new(s).translate }.join('')
        end
      end

    end
  end
end
