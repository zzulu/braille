module Braille
  module Ko
    class Jaso
      attr_reader :syllable

      def initialize(syllable="")
        @syllable = syllable # syllable은 오로지 한글 음절만 오도록 한다.

        # 여러 글자가 들어왔을 경우 첫 한 음절만 가져오도록 or 전부다 처리하도록, Exception 처리

        base_syllable = @syllable.unpack("U").shift - BASE_UNICODE

        @jong = (base_syllable) % 28
        @jung = ((base_syllable - @jong) / 28) % 21
        @cho = (((base_syllable - @jong) / 28) - @jung) / 21
      end

      def cho
        CHO_SET[@cho]
      end

      def jung
        JUNG_SET[@jung]
      end

      def jong
        JONG_SET[@jong]
      end

      def translated_cho
        CHO[CHO_SET[@cho]]
      end

      def translated_jung
        JUNG[JUNG_SET[@jung]]
      end

      def translated_jong
        JONG[JONG_SET[@jong]]
      end

      def translate
        if ABBREVIATIONS.has_key?(assemble(@cho, @jung, DEFAULT_JONG))
          if JONG_SET[@jong] == "ㅆ" && assemble(@cho, @jung, DEFAULT_JONG) == "파" # '팠' 예외처리
            [self.translated_cho, self.translated_jung, self.translated_jong]
          else
            [ABBREVIATIONS[assemble(@cho, @jung, DEFAULT_JONG)], self.translated_jong]
          end
        elsif ABBREVIATIONS.has_key?(assemble(DEFAULT_CHO, @jung, @jong))
          [self.translated_cho, ABBREVIATIONS[assemble(DEFAULT_CHO, @jung, @jong)]]
        elsif ABBREVIATIONS.has_key?(@syllable)
          [ABBREVIATIONS[@syllable]]
        else
          [self.translated_cho, self.translated_jung, self.translated_jong]
        end
      end

      private

        def assemble(cho, jung, jong)
          [BASE_UNICODE + (cho * 21 * 28) + (jung * 28) + jong].pack("U")
        end

    end
  end
end
