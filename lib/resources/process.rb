class ProcessManager
    attr_reader :commands

    def initialize
        @commands = []
    end

    def list
        @commands << "ps aux"
    end

    def kill(pid)
        @commands << "kill #{pid}"
    end

    def kill_force(pid)
        @commands << "kill -9 #{pid}"
    end

    def find(name)
        @commands << "pgrep #{name}"
    end

    def top
        @commands << "top"
    end
end
