require_relative "../services/systemd-service.rb"

class ServiceFactory
    SERVICES = {
        systemd: SystemdService,
    }

    def self.create(type, name)
        cls = SERVICES[type.to_sym]

        raise ArgumentError, "Unsupported service type: #{type}" unless cls

        cls.new(name)
    end
end