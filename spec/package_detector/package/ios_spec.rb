require 'spec_helper'

describe PackageDetector::Package::Ios do
  subject { PackageDetector::Package::Ios.new }
  its(:file_type) { should be_instance_of PackageDetector::Visitor::Zip }
  expected_dir_struct = [
    File.join('Payload', '[^/]+.app', 'embedded.mobileprovision'),
    File.join('Payload', '[^/]+.app', 'Info.plist')
  ]
  its(:dir_struct) {
    should eq expected_dir_struct
  }
end
