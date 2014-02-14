class PackageDetector
  class Visitor
    def visit(package)
      raise NotImplementedError, 'you need to specify how to compose'
    end
  end
end

root_dir = File.expand_path(File.join('..', 'visitor', '*'), __FILE__)
Dir[root_dir].map{|fn|
  require fn if File.file?(fn)
}
