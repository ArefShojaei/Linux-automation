class System
    attr_reader :commands

    def initialize
        @commands = []
    end

    def hostname
        @commands << "hostname"
    end

    def set_hostname(name)
        @commands << "sudo hostnamectl set-hostname #{name}"
    end

    def reboot
        @commands << "sudo reboot"
    end

    def shutdown
        @commands << "sudo shutdown now"
    end

    def uptime
        @commands << "uptime"
    end

    def disk_usage
        @commands << "df -h"
    end

    def memory_usage
        @commands << "free -m"
    end
end
