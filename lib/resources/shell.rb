class Shell
    attr_reader :commands

    def initialize
        @commands = []
    end

    def run(cmd)
        @commands << cmd
    end

    def script(path)
        @commands << "bash #{path}"
    end

    def export(var, value)
        @commands << "export #{var}=#{value}"
    end

    def append_path(path)
        @commands << "export PATH=$PATH:#{path}"
    end
end
