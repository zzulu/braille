#encoding: UTF-8
require 'braille/ko/constants'
require 'braille/ko/char'
require 'braille/ko/jaso'
require 'braille/ko/word'
require 'braille/ko/convert'

module Braille
  module Ko

    class << self
      def translate(input)
        words = input.scan(/[가-힣.,!?]+|[0-9A-Za-z.,!?]+/)
        translated = words.map { |word| Word.new(word).translate }
        translated.join(' ')
      end
    end
  
  end
end
