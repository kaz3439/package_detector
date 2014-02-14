class PackageDetector
  class Package
    def accept(package, visitor)
      visitor.visit(package, self)
    end
    def file_type
      raise NotImplementedError, 'you need to specify which composite is used'
    end
    def dir_struct
      raise NotImplementedError, 'you need to specify directory structure'
    end
  end
end

root_dir = File.expand_path(File.join('..', 'package', '*'), __FILE__)
Dir[root_dir].map{|fn|
  require fn if File.file?(fn)
}
