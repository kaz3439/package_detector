require 'spec_helper'

describe PackageDetector do

  before(:each) do
    @io = IO.open(0)
    @pd = PackageDetector.new(@io)
  end

  it 'should start to visit with guess method' do
    elem = double('Element')
    elem.stub(:accept).with(@io, 'file_type').and_return true
    elem.stub(:file_type).and_return 'file_type'
    expect(@pd.guess(elem)).to be_true
  end

  it 'should start to visit all of package_type with detect method' do
    ary = ['./test.rb']
    Dir.stub('[]').and_return ary
    Test = double()
    Test.stub(:new).and_return('file_type')
    ary.stub(:map).and_return([Test])
    File.stub(:expand_path).and_return '.'
    File.stub(:file?).and_return true
    @pd.stub(:guess).with('file_type').and_return true
    expect(@pd.detect).to be_true
  end

end
