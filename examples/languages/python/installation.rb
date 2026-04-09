require_relative "../../../lib/dsl/task.rb"

task "Install Python Tools" do
    distribution :debian

    package do
        install "python3"
        install "python3-pip"
        install "python3-venv"
        install "python3-dev"
    end
end


task "Upgrade Pip" do
    shell do
        run "python3 -m pip install --upgrade pip"
        run "python3 -m pip install --upgrade setuptools"
        run "python3 -m pip install --upgrade wheel"
    end
end

task "Setup Python Dev Tools" do
    shell do
        run "python3 -m pip install black"
        run "python3 -m pip install flake8"
        run "python3 -m pip install pylint"
        run "python3 -m pip install pytest"
        run "python3 -m pip install ipython"
    end
end
