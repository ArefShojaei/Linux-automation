require_relative "../resources/service.rb"

class SystemdService < Service
    def initialize(name)
        super(name)
    end

    def start
        @commands << "sudo systemctl start #{@name}"
    end

    def stop
        @commands << "sudo systemctl stop #{@name}"
    end

    def restart
        @commands << "sudo systemctl restart #{@name}"
    end

    def reload
        @commands << "sudo systemctl reload #{@name}"
    end

    def enable
        @commands << "sudo systemctl enable #{@name}"
    end

    def disable
        @commands << "sudo systemctl disable #{@name}"
    end

    def status
        @commands << "systemctl status #{@name}"
    end
end
