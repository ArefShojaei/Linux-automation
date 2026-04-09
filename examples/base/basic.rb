require_relative "../../lib/dsl/task.rb"

task "Install Basic Tools" do
    distribution :debian

    shell do
        run "sudo apt update"
    end

    package do
        # network tools
        install "curl"
        install "wget"
        install "net-tools"
        install "dnsutils"

        # monitoring
        install "htop"
        install "iotop"

        # cli utilities
        install "vim"
        install "neovim"
        install "nano"
        install "less"
        install "tree"

        # archive tools
        install "zip"
        install "unzip"
        install "tar"

        # download / web
        install "links"

        # version control
        install "git"

        # useful utilities
        install "tmux"
        install "build-essential"
        install "make"
        install "gcc"
    end
end
