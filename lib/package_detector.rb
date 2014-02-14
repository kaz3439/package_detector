require "package_detector/version"
require "package_detector/package"
require "package_detector/visitor"

class PackageDetector
  ROOT_DIR = File.expand_path(File.join('..', 'package_detector', 'package', '*'), __FILE__)
  attr_accessor :package

  def initialize(package)
    if package.kind_of? IO
      @package = package
    else
      raise TypeError, "can't recieve an object except for IO object."
    end
  end

  def detect
    package_types = Dir[ROOT_DIR].map{|n|
      if File.file?(n)
        package_type(File.basename(n, '.rb'))
      end
    }
    package_types.detect{|type| self.guess(type.new)}
  end

  def guess(package_type)
    package_type.accept(@package, package_type.file_type)
  end

  Dir[ROOT_DIR].each do |n|
    if File.file?(n)
      method_basename = File.basename(n, '.rb')
      method_name = "#{method_basename}?"
      define_method(method_name) { self.guess(package_type(method_basename).new) }
    end
  end

  private
  def package_type(basename)
    klass = basename.split("_").map {|s| s.capitalize }.join("")
    Kernel.const_get('PackageDetector').const_get('Package').const_get(klass)
  end

end
