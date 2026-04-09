require_relative "../resources/package.rb"

class AptPackage < Package
    def install(name)
        @commands << "sudo apt install -y #{name}"
    end

    def remove(name)
        @commands << "sudo apt remove -y #{name}"
    end

    def reinstall(name)
        remove(name)
        install(name)
    end

    def purge(name)
        @commands << "sudo apt purge -y #{name}"
    end

    def autoremove
        @commands << "sudo apt autoremove -y"
    end
end
