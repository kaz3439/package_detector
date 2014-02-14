require 'spec_helper'

describe PackageDetector::Visitor do
  it 'should be parent class for classes which have visit method' do
    visitor = PackageDetector::Visitor.new
    proc { visitor.visit(nil) }.should raise_error NotImplementedError
  end
end
