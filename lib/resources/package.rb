class Package
    attr_reader :commands

    def initialize
        @commands = []
    end

    def install(name);end
    def remove(name);end
    def reinstall(name);end
    def purge(name);end
    def autoremove;end
end