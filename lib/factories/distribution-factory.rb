require_relative "../distributions/debian-distribution.rb"
require_relative "../distributions/red-hat-distribution.rb"

class DistributionFactory
    DISTRIBUTIONS = {
        debian: DebianDistribution,
        redhat: RedHatDistribution 
    }

    def self.create(type)
        cls = DISTRIBUTIONS[type.to_sym]

        raise ArgumentError, "Unsupported distribution type: #{type}" unless cls

        cls.new
    end
end