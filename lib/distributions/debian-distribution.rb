require_relative "../resources/distribution.rb"

class DebianDistribution < Distribution
    def package_manager
      "apt"
    end
end