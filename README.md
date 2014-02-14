# PackageDetector

This gem lets you detect which kind of packages it is.
I implemented it based on "Visitor Pattern".

## Installation

Add this line to your application's Gemfile:

    gem 'package_detector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install package_detector

## Usage

```ruby
pd = PackageDetector.new(File.open('/path/to/your/app'))
case pd.detect 
when PackageDetector::Package::Ios
  puts 'It seems to be an ios app!'
when PackageDetector::Package::Android
  puts 'It seems to be an android app!'
else
  puts 'I cannot understand this app...'
end

res = pd.guess PackageDetector::Package::Ios
puts res
#=> true

pd.ios?
#=> true

pd.android?
#=> false

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
