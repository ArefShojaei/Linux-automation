require_relative "../../../lib/dsl/task.rb"

task "Install Golang" do
    distribution :debian
    
    package do
      install "golang"
    end
end
