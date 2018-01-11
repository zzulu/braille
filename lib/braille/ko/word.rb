#encoding: UTF-8
module Braille
  module Ko
    class Word
      attr_reader :word
      
      def initialize(word)
        @word = word
      end

      def translate
        if group_arr = GROUPS.detect{|k, v| @word.start_with?(k)} # return Array. ex) ["그래서", "⠁⠎"]
          syllables = @word.delete(group_arr.shift).scan(/[가-힣]/)
        else
          syllables = @word.scan(/[가-힣]/)
        end
        syllables.map{|s| Jaso.new(s).translate }.unshift(*group_arr).join('')
      end

    end
  end
end
