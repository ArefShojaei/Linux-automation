require_relative "../../lib/dsl/task.rb"

task "Install Apache" do
    distribution :debian
    
    package do
      install "apache2"
    end

    service "apache2" do
      enable
      start
    end
end
