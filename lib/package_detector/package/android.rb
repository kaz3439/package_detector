module PackageDetector
  class Package
    class Android < Package

      def file_type
        PackageDetector::Visitor::Zip.new
      end

      def dir_struct
        [
          'resources.arsc',
          'classes.dex',
          'AndroidManifest.xml',
        ]
      end

    end
  end
end
