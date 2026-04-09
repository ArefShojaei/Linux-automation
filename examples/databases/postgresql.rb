require_relative "../../lib/dsl/task.rb"

task "Install PostgreSQL" do
    package do
      install "postgresql"
    end
end

