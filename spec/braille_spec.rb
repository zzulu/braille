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

    it 'return white space if nil or white space' do
      result = Braille::Ko::Jaso.new(' ').cho
      expect(result).to eq(' ')
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

  describe '#split' do
    it 'return [ㅎ, ㅘ, ㅇ] if 황' do
      result = Braille::Ko::Jaso.new('황').split
      expect(result).to match_array(["ㅎ", "ㅘ", "ㅇ"])
    end

    it 'return [가, ㅇ] if 강' do
      result = Braille::Ko::Jaso.new('강').split
      expect(result).to match_array(["가", "ㅇ"])
    end

    it 'return [ㄱ, 운] if 군' do
      result = Braille::Ko::Jaso.new('군').split
      expect(result).to match_array(["ㄱ", "운"])
    end

    it 'return [것] if 것' do
      result = Braille::Ko::Jaso.new('것').split
      expect(result).to match_array(["것"])
    end

    it 'return [ㅍ, ㅏ, ㅆ] if 팠' do # '팠'은 약자로 적지 않는다.
      result = Braille::Ko::Jaso.new('팠').split
      expect(result).to match_array(["ㅍ","ㅏ","ㅆ"])
    end    
  end
end  
