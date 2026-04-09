require_relative "../../../lib/dsl/task.rb"

task "Install PHP" do
    distribution :debian

    package do
        install "php"
        install "php-cli"
        install "php-fpm"
        install "php-mysql"
        install "php-xml"
        install "php-mbstring"
    end
end
