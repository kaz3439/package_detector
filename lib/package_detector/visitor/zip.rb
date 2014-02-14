require 'zip/zip'
require 'tempfile'

class PackageDetector
  class Visitor
    class Zip < Visitor
      def visit(package, element)
        paths = Hash[*element.dir_struct.zip(Array.new(element.dir_struct.count, false)).flatten]
        ::Zip::ZipFile.foreach(package.path) do |zipfile|
          paths.keys.map { |file_path|
            if zipfile.name =~ Regexp.new(file_path)
              paths[file_path] = true
            end
          }
        end

        if paths.keys.select{|key| paths[key] == false }.empty?
          true
        else
          false
        end
      end
    end
  end
end
