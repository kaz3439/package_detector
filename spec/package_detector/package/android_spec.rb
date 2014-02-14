require 'spec_helper'

describe PackageDetector::Package::Android do
  subject { PackageDetector::Package::Android.new }
  its(:file_type) { should be_instance_of PackageDetector::Visitor::Zip }
  expected_dir_struct = [
    'resources.arsc',
    'classes.dex',
    'AndroidManifest.xml',
  ]
  its(:dir_struct) {
    should eq expected_dir_struct
  }
end
