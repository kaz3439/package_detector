require 'visitor'

module PackageDetector
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
