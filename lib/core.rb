require_relative "./modules/command.rb"

class Core
    include Command::HasPackageManager, Command::HasServiceManager,
            Command::HasFileSystem, Command::HasUserManager,
            Command::HasExecutable, Command::HasSystemManager,
            Command::HasRequestSender, Command::HasDebuggerMode

    attr_reader :commands, :mode

    def initialize(name)
        @commands = []
        
        @mode = :off
    end
end