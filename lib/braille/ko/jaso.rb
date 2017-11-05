module Braille
  module Ko
    class Jaso
      attr_reader :syllable

      def initialize(syllable="")
        @syllable = syllable.scan(/[가-힣]/).shift # syllable은 오로지 한글 음절만 오도록 한다. 여러 글자가 들어왔을 경우, 첫 한 음절만 가져온다.

        if @syllable.nil?
          @cho = @jung = @jong = -1
        else
          base_syllable = @syllable.unpack("U").shift - BASE_UNICODE

          @jong = (base_syllable) % 28
          @jung = ((base_syllable - @jong) / 28) % 21
          @cho = (((base_syllable - @jong) / 28) - @jung) / 21
        end
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

      def disassemble
        [CHO_SET[@cho], JUNG_SET[@jung], JONG_SET[@jong]]      
      end

      def split
        if ABBREVIATIONS.has_key?(assemble(@cho, @jung, DEFAULT_JONG))
          if JONG_SET[@jong] == "ㅆ" && assemble(@cho, @jung, DEFAULT_JONG) == "파" # '팠' 예외처리
            disassemble
          else
            [assemble(@cho, @jung, DEFAULT_JONG), JONG_SET[@jong]]
          end
        elsif ABBREVIATIONS.has_key?(assemble(DEFAULT_CHO, @jung, @jong))
          [CHO_SET[@cho], assemble(DEFAULT_CHO, @jung, @jong)]
        elsif ABBREVIATIONS.has_key?(@syllable)
          [@syllable]
        else
          disassemble
        end
      end

      private

        def assemble(cho, jung, jong)
          [BASE_UNICODE + (cho * 21 * 28) + (jung * 28) + jong].pack("U")
        end

    end
  end
end
