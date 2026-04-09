class Group
    attr_reader :commands

    def initialize(name)
        @name = name
        @commands = []
    end

    def create
        @commands << "sudo groupadd #{@name}"
    end

    def remove
        @commands << "sudo groupdel #{@name}"
    end

    def add_user(user)
        @commands << "sudo usermod -aG #{@name} #{user}"
    end

    def remove_user(user)
        @commands << "sudo gpasswd -d #{user} #{@name}"
    end
end
