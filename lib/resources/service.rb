class Service
    attr_reader :commands

    def initialize(name)
        @name = name
        @commands = []
    end

    def start; end
    def stop; end
    def restart; end
    def reload; end
    def enable; end
    def disable; end
    def status; end
end
