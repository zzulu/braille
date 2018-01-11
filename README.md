# Braille

한글 점역기

Braille Translator for Korean

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'braille'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install braille
```

## Usage

```ruby
require 'braille'

Braille::Ko.translate('저는 줄루입니다') #=> '⠨⠎⠉⠵ ⠨⠯⠐⠍⠕⠃⠉⠕⠊'
```

'한국 점자 규정'에 따른 점역 예외 상황들에 대한 대응이 완벽하지 않습니다. 오역이 가능성이 존재하며, 정확한 점역을 위해서는 [국립국어원 한국 점자 규정](http://www.korean.go.kr/front/etcData/etcDataView.do?etc_seq=542&mn_id=46)을 참고해 주시기 바랍니다.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zzulu/braille. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Braille project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/braille/blob/master/CODE_OF_CONDUCT.md).
