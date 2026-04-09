class User
    attr_reader :commands

    def initialize(name)
        @name = name
        @commands = []
    end

    def create(home: nil, shell: nil, group: nil)
        cmd = "sudo useradd"

        cmd += " -m" if home
        cmd += " -d #{home}" if home
        cmd += " -s #{shell}" if shell
        cmd += " -g #{group}" if group

        cmd += " #{@name}"
        @commands << cmd
    end

    def remove
        @commands << "sudo userdel #{@name}"
    end

    def remove_with_home
        @commands << "sudo userdel -r #{@name}"
    end

    def lock
        @commands << "sudo usermod -L #{@name}"
    end

    def unlock
        @commands << "sudo usermod -U #{@name}"
    end

    def add_to_group(group)
        @commands << "sudo usermod -aG #{group} #{@name}"
    end

    def change_shell(shell)
        @commands << "sudo usermod -s #{shell} #{@name}"
    end
end
