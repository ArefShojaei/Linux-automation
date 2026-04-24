require_relative "../resources/request.rb"

class RequestFactory
    ADAPTORS = {
        curl: Curl,
    }

    def self.create(type)
        cls = ADAPTORS[type.to_sym]

        raise ArgumentError, "Unsupported adaptor type: #{type}" unless cls

        cls.new
    end
end