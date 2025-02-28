# The function projects allows you to quickly navigate to a project directory by selecting it from a list of directories in the PROJECTS_DIRECTORY.
# It uses fzf to display the list of directories and allows you to select one by typing the name of the directory.
function projects 
    if not test -d $PROJECTS_DIRECTORY
        echo "Error: Projects directory does not exist: $PROJECTS_DIRECTORY"
        return 1
    end
    
    set -l project_directories (find $PROJECTS_DIRECTORY -maxdepth 1 -mindepth 1 -type d | sort)
    if test (count $project_directories) -eq 0
        echo "No projects found in $project_directories"
        return 1
    end
    
    set -l formatted_directories
    for dir in $project_directories
        set -l name (basename $dir)
        set -a formatted_directories $name
    end
    
    set -l selected_project (printf "%s\n" $formatted_directories | fzf --height 33% --reverse --border --prompt="Select project: ")
    if test -n "$selected_project"
        cd "$PROJECTS_DIRECTORY/$selected_project"
    end
end