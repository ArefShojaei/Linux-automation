require_relative "../../lib/dsl/task.rb"

task "Install MySQL" do
    distribution :debian

    package do
      install "mysql-server"
    end

    service "mysql" do
      enable
      start
    end
end
