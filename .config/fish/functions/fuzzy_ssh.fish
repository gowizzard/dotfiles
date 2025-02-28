# The function fuzzy_ssh allows you to quickly connect to an SSH host by selecting it from a list of hosts in the SSH configuration directory.
# It uses fzf to display the list of hosts and allows you to select one by typing the name of the host.
function fuzzy_ssh
    set -l ssh_config_directory "$HOME/.ssh/config.d"
    if not test -d $ssh_config_directory
        echo "Error: No SSH configuration directory found: $ssh_config_directory"
        return 1
    end

    set -l hosts (grep -hE "^Host " $ssh_config_directory/* | awk '{print $2}' | fzf --height 25% --reverse --border --prompt="Select host: ")
    if test -n "$hosts"
        ssh $hosts
    end
end