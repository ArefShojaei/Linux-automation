require_relative "../../../lib/dsl/task.rb"

task "Install NodeJS" do
    distribution :debian
    
    package do
        install "nodejs"
        install "npm"
    end
end


task "Install NodeJS Dev Tools" do
    shell do
        run "npm install -g yarn pnpm typescript"
        run "npm install -g nodemon eslint prettier"
        run "npm install -g jest vite vitest webpack webpack-cli"
    end
end  