require_relative "../packages/apt-package.rb"
require_relative "../packages/dnf-package.rb"

class PackageFactory
    PACKAGES = {
        apt: AptPackage,
        dnf: DnfPackage,
    }

    def self.create(type)
        cls = PACKAGES[type.to_sym]

        raise ArgumentError, "Unsupported package type: #{type}" unless cls

        cls.new
    end
end