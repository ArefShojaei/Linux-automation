require_relative "../factories/package-factory.rb"
require_relative "../factories/service-factory.rb"
require_relative "../factories/request-factory.rb"
require_relative "../factories/distribution-factory.rb"
require_relative "../resources/system.rb"
require_relative "../resources/process.rb"
require_relative "../resources/file_system.rb"
require_relative "../resources/user.rb"
require_relative "../resources/group.rb"
require_relative "../resources/shell.rb"

module Command
    module HasDebuggerMode
        def debug(status)
            @mode = status
        end
    end

    module HasPackageManager
        def package(&block)
            package_manager = @distribution.package_manager

            package = PackageFactory.create(package_manager)

            package.instance_eval(&block)

            @commands.concat(package.commands)
        end
    end

    module HasServiceManager
        def service(name, &block)
            service_manager = @distribution.service_manager

            service = ServiceFactory.create(service_manager, name)

            service.instance_eval(&block)

            @commands.concat(service.commands)
        end
    end

    module HasFileSystem
        def filesystem(&block)
            fs = FileSystem.new

            fs.instance_eval(&block)

            @commands.concat(fs.commands)
        end
    end

    module HasUserManager
        def user(name, &block)
            user = User.new(name)

            user.instance_eval(&block)

            @commands.concat(user.commands)
        end

        def group(name, &block)
            group = Group.new(name)

            group.instance_eval(&block)

            @commands.concat(group.commands)
        end
    end

    module HasExecutable
        def shell(&block)
            shell = Shell.new

            shell.instance_eval(&block)

            @commands.concat(shell.commands)
        end
    end

    module HasSystemManager
        def distribution(name)
            @distribution = DistributionFactory.create(name)
        end

        def system(&block)
            sys = System.new

            sys.instance_eval(&block)

            @commands.concat(sys.commands)
        end

        def process(&block)
            process = Process.new

            process.instance_eval(&block)

            @commands.concat(process.commands)
        end
    end

    module HasRequestSender
        def http(title, type: :curl, &block)
            request = RequestFactory.create(type)

            request.instance_eval(&block)

            @commands.concat(request.commands)
        end    
    end
end