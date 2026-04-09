#require_relative "../../../lib/dsl/task.rb"
require_relative "./installation.rb"

task "Setup Laravel Environment" do
    shell do
      run "composer global require laravel/installer"
    end
end
