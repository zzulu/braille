require "spec_helper"

RSpec.describe Braille do
  it "has a version number" do
    expect(Braille::VERSION).not_to be nil
  end
end

RSpec.describe Braille::Ko::Jaso do  
  describe '#cho' do
    it 'return ㅎ if 황' do
      result = Braille::Ko::Jaso.new('황').cho
      expect(result).to eq('ㅎ')
    end
  end

  describe '#jung' do
    it 'return ㅘ if 황' do
      result = Braille::Ko::Jaso.new('황').jung
      expect(result).to eq('ㅘ')
    end
  end

  describe '#jong' do
    it 'return ㅇ if 황' do
      result = Braille::Ko::Jaso.new('황').jong
      expect(result).to eq('ㅇ')
    end
  end

  describe '#translate' do
    it 'return ["⠚", "⠧", "⠶"] if 황' do
      result = Braille::Ko::Jaso.new('황').translate
      expect(result).to match_array(["⠚", "⠧", "⠶"])
    end

    it 'return ["⠫", "⠶"] if 강' do
      result = Braille::Ko::Jaso.new('강').translate
      expect(result).to match_array(["⠫", "⠶"])
    end

    it 'return ["⠈", "⠛"] if 군' do
      result = Braille::Ko::Jaso.new('군').translate
      expect(result).to match_array(["⠈", "⠛"])
    end

    it 'return ["⠸⠎"] if 것' do
      result = Braille::Ko::Jaso.new('것').translate
      expect(result).to match_array(["⠸⠎"])
    end

    it 'return ["⠙", "⠣", "⠌"] if 팠' do # '팠'은 약자로 적지 않는다.
      result = Braille::Ko::Jaso.new('팠').translate
      expect(result).to match_array(["⠙", "⠣", "⠌"])
    end    
  end
end  

RSpec.describe Braille::Ko::Word do
  describe '#translated' do
    it 'return "⠨⠎⠐⠕⠫" if "저리가"' do
      result = Braille::Ko::Word.new('저리가').translate
      expect(result).to eq("⠨⠎⠐⠕⠫")
    end

    it 'return "⠣⠒⠉⠻" if "안녕"' do
      result = Braille::Ko::Word.new('안녕').translate
      expect(result).to eq("⠣⠒⠉⠻")
    end

    # ㅅ, ㅆ, ㅈ, ㅉ, ㅊ 일 경우 '영' => '엉'으로 사용 케이스

    it 'return "⠁⠥" if "그리고"' do
      result = Braille::Ko::Word.new('그리고').translate
      expect(result).to eq("⠁⠥")
    end
  end
end

RSpec.describe Braille::Ko do  
  describe '.translate' do
    it 'return "⠨⠎⠉⠵ ⠚⠧⠶⠨⠛⠍⠕⠃⠉⠕⠊" if "저는 황준우입니다"' do
      result = Braille::Ko.translate('저는 황준우입니다')
      expect(result).to eq("⠨⠎⠉⠵ ⠚⠧⠶⠨⠛⠍⠕⠃⠉⠕⠊")
    end
  end
end

# RSpec.describe Braille::Ko::Char do
#   describe '#number?' do
#     it 'return true if 123' do
#       result = Braille::Ko::Char.new('123').number?
#       expect(result).to eq(true)
#     end
#   end

#   describe '#char?' do
#     it 'return true if 황' do
#       result = Braille::Ko::Char.new('황').char?
#       expect(result).to eq(true)
#     end
#   end
# end

