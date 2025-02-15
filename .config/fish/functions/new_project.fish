function new_project
    if test (count $argv) -gt 1
        echo "too many arguments were handed over"
    else if test (count $argv) -eq 1
        mkdir -p "$PROJECTS_DIRECTORY/$argv[1]"
        cd "$PROJECTS_DIRECTORY/$argv[1]"
        git init
    else
        echo "no project title given"
    end
end