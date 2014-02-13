require "package_detector/version"
require "package_detector/package"
require "package_detector/visitor"

module PackageDetector
  def self.detect(package)
    root_dir = File.expand_path(File.join('..', 'package_detector', 'package', '*'), __FILE__)
    package_types = Dir[root_dir].map{|n|
      if File.file?(n)
        klass = File.basename(n, '.rb').split("_").map {|s| s.capitalize }.join("")
        Kernel.const_get('PackageDetector').const_get('Package').const_get(klass)
      end
    }
    package_types.detect{|type| self.guess(package, type.new)}
  end

  def self.guess(package, package_type)
    package_type.accept(package, package_type.file_type)
  end
end
