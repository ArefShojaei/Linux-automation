# Linux Automation
A simple, powerful, and extensible **Domain‑Specific Language for Linux task**, written in Ruby.  
This DSL allows you to define custom configuration in a clean, human‑friendly syntax and automatically translate them into real Linux commands.

## Key Features

- Multi‑distribution support (APT / DNF)
- Package management (install, remove, purge, autoremove, reinstall)
- Service management (systemd)
- Filesystem operations (file, directory, symlink)
- User and group management
- HTTP requests (curl/wget)
- Shell and system command execution

## Quick Example
```ruby
require_relative "./lib/dsl/task.rb"

task "Install-basic-tools" do
  distribution :debian

  package do
    install "curl"
    install "vim"
    install "htop"
  end

  service "ssh" do
    enable
    start
  end

  filesystem do
    cd "/home/aref/Desktop"
  end

  shell do
    run "echo 'System Ready!'"
  end
end
```

## Guide
> Task

**Task** is a wrapper DSL to define your own linux configurations.


Pattern:
```ruby
task "title" do
  ...
end
```

Usage:
```ruby
task "Linux-server" do
  ...
end
```

> Debug

Set **debug** mode to see all commands before running as a preview!


Pattern:
```ruby
debug :status # :on & :off
```

Usage:
```ruby
task "Linux-server" do
  debug :on
end
```

> Destribution

every linux system can be wrapped for a destribution such as **Debian** or **Red-hat** .

Usage:
```ruby
task "Linux-server" do
  destribution :debian
end
```

> Package

every linux destribution for using packages should use a package manager  such as **apt** or **dnf** .


Pattern:
```ruby
package do
  ...
end
```

Usage:
```ruby
task "Debian-linux-server" do
  destribution :debian

  package do
    install "htop" # sudo apt install -y htop
    remove "htop" # sudo apt remove -y htop
    reinstall "htop" # sudo apt remove -y htop & sudo apt install -y htop
    purge "htop" # sudo apt purge -y htop
    autoremove # sudo apt autoremove -y
  end
end
```

```ruby
task "Redhat-linux-server" do
  destribution :redhat

  package do
    install "htop" # sudo dnf install -y htop
    remove "htop" # sudo dnf remove -y htop
    reinstall "htop" # sudo dnf remove -y htop & sudo dnf install -y htop
    purge "htop" # sudo dnf purge -y htop
    autoremove # sudo dnf autoremove -y
  end
end
```

> Service

Services in linux can be helpful to management processes & activation programs such as **nginx**, **apache2**, **mysql** & etc... .

Pattern:
```ruby
service "name" do
  ...
end
```

Usage:
```ruby
task "Linux-server" do
  destribution :debian

  service "nginx" do
    disable # sudo systemctl disable nginx
    enable # sudo systemctl enable nginx
    stop # sudo systemctl stop nginx
    start # sudo systemctl start nginx
    restart # sudo systemctl restart nginx
    reload # sudo systemctl reload nginx
  end
end
```

> Shell

Run commands in console env that sends to kernel to run in Hardware or Software in linux like Send & Receive pattern for a command such as **echo**, **pwd**, **ls** & etc...

Pattern:
```ruby
shell do
  ...
end
```

Usage:
```ruby
task "Linux-server" do
  destribution :debian

  shell do
    run "All commands was run successfully." # echo "All commands was run successfully."
  end
end
```
