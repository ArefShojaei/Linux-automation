require_relative "../../lib/dsl/task.rb"

task "Install MongoDB" do
    package do
      install "mongodb"
    end
end

