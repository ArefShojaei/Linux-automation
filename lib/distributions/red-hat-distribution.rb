require_relative "../resources/distribution.rb"

class RedHatDistribution < Distribution
    def package_manager
      "dnf"
    end
end