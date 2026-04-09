#require_relative "../../../lib/dsl/task.rb"
require_relative "./installation.rb"

task "Setup Python for AI" do
  shell do
      run "python3 -m pip install numpy"
      run "python3 -m pip install pandas"
      run "python3 -m pip install matplotlib"
      run "python3 -m pip install seaborn"
      run "python3 -m pip install scikit-learn"
      run "python3 -m pip install scipy"
      run "python3 -m pip install jupyter"
      run "python3 -m pip install notebook"
      run "python3 -m pip install ipykernel"
  end
end