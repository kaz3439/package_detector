require 'spec_helper'

describe PackageDetector::Package do
  before(:all) do
    @package_difinition = PackageDetector::Package.new
  end
  it 'should raise to file_type ' do
    proc { @package_difinition.file_type }.should raise_error NotImplementedError
  end
  it 'should raise to file_type ' do
    proc { @package_difinition.dir_struct }.should raise_error NotImplementedError
  end
  it 'should accept package and detector which has visit method' do
      detector = double("PackageDetection::Detector")
      detector.stub(:visit).with('package', @package_difinition).and_return(true)
      expect(@package_difinition.accept('package', detector)).to be_true

  end
end
