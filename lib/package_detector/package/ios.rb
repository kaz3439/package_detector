class PackageDetector
  class Package
    class Ios < Package

      def file_type
        PackageDetector::Visitor::Zip.new
      end

      def dir_struct
        [
          File.join('Payload', '[^/]+.app', 'embedded.mobileprovision'),
          File.join('Payload', '[^/]+.app', 'Info.plist')
        ]
      end

    end
  end
end
