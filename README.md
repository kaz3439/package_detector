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
case PackageDetector.detect('/path/to/your/app')
when PackageDetector::Package::Ios
  puts 'It seems to be an ios app!'
when PackageDetector::Package::Android
  puts 'It seems to be an android app!'
else
  puts 'I cannot understand this app...'
end

res = PackageDetector.guess('/path/to/your/app', PackageDetector::Package::Ios)

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
