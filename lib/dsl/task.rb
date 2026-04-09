require_relative "../core.rb"

def task(name, &block)
    app = Core.new(name)

    app.commands << "echo '[START] \"#{name}\" task'"

    app.instance_eval(&block)

    app.commands << "echo '[END] \"#{name}\" task'"
    app.commands << "echo '------------------------'"

    if app.mode == :on
        app.commands.each { |command| puts command }
    elsif app.mode == :off
        app.commands.each { |command| system(command) }
    else
        raise ArgumentError, "Debug mode status should be 'on' or 'off'"
    end
end