class FileSystem
    attr_reader :commands

    def initialize
      @commands = []
    end

    def cd(path)
      @commands << "cd #{path}"
    end

    def touch(path)
      @commands << "touch #{path}"
    end

    def rm(path)
      @commands << "rm -f #{path}"
    end

    def mkdir(path)
      @commands << "mkdir -p #{path}"
    end

    def rmdir(path)
      @commands << "rm -rf #{path}"
    end

    def cp(src, dest)
      @commands << "cp -r #{src} #{dest}"
    end

    def mv(src, dest)
      @commands << "mv #{src} #{dest}"
    end

    def chmod(mode, path)
      @commands << "chmod #{mode} #{path}"
    end

    def chown(owner, path)
      @commands << "chown #{owner} #{path}"
    end

    def symlink(target, link)
      @commands << "ln -s #{target} #{link}"
    end

    def write_file(path, content)
      @commands << "echo '#{content}' > #{path}"
    end

    def append_file(path, content)
      @commands << "echo '#{content}' >> #{path}"
    end
end
