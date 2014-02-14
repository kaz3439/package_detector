require 'spec_helper'

describe PackageDetector::Visitor::Zip do
  context 'when receive correct file' do
    it 'should return ture' do
      package = double("PackageDetection::Package::Ios")
      package.stub(:dir_struct).and_return([
        File.join('Payload', '[^/]+.app', 'embedded.mobileprovision'),
        File.join('Payload', '[^/]+.app', 'Info.plist')
      ])
      sample_file_path = File.expand_path(File.join('..', '..', '..', 'fixtures', 'files', 'Sample.ipa'), __FILE__)
      result = PackageDetector::Visitor::Zip.new.visit(File.new(sample_file_path), package)
      expect(result).to be_true
    end
  end
end
