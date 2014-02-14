# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'package_detector/version'

Gem::Specification.new do |spec|
  spec.name          = "package_detector"
  spec.version       = PackageDetector::VERSION
  spec.authors       = ["Kaz"]
  spec.email         = ["k.hayashi.info@gmail.com"]
  spec.description   = %q{Detect app package from the directory structure.}
  spec.summary       = %q{Detect App Package from the directory structure.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "rubyzip"
end
