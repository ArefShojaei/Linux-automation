require_relative "../../lib/dsl/task.rb"

task "Install Nginx" do
    distribution :debian

    package do
      install "nginx"
    end

    service "nginx" do
      enable
      start
    end
end
