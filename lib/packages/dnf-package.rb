require_relative "../resources/package.rb"

class DnfPackage < Package
    def install(name)
        @commands << "sudo dnf install -y #{name}"
    end

    def remove(name)
        @commands << "sudo dnf remove -y #{name}"
    end

    def reinstall(name)
        @commands << "sudo dnf reinstall -y #{name}"
    end

    def purge(name)
        remove(name)
    end

    def autoremove
        @commands << "sudo dnf autoremove -y"
    end
end
