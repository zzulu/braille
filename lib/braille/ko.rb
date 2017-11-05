#encoding: UTF-8
require 'braille/ko/constants'
require 'braille/ko/word'
require 'braille/ko/jaso'
require 'braille/ko/convert'

module Braille
  module Ko

    class << self
      def translate(input)
        words = input.scan(/[0-9A-Za-zㄱ-ㅎㅏ-ㅣ가-힣_.,!?]+/)
        translated = words.map { |word| Word.new(word).word }
        translated.join('')
      end
    end
  
  end
end
