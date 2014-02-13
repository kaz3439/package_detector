require "package_detector/version"
require "activesupport"

module PackageDetector
  def self.detect(package)
    root_dir = File.expand_path(File.join('..', 'package_detector', 'package', '*'), __FILE__)
    package_types = Dir[root_dir].map{|n|
      if File.file?(n)
        File.join('package_detection', 'package', File.basename(n, '.rb')).camelize.constantize
      end
    }
    package_types.detect{|type| self.guess(package, type.new)}
  end

  def self.guess(package, package_type)
    package_type.accept(package, package_type.file_type)
  end
end
