#require_relative "../../../lib/dsl/task.rb"
require_relative "./installation.rb"

task "Setup Python for Backend" do
  shell do
      run "python3 -m pip install flask"
      run "python3 -m pip install fastapi"
      run "python3 -m pip install django"
      run "python3 -m pip install uvicorn"
      run "python3 -m pip install gunicorn"
      run "python3 -m pip install python-dotenv"
  end
end