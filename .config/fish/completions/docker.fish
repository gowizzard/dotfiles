# Autocompletion for docker commands in fish shell. The `-f` flag is used to force the completion.
complete -c docker -n '__fish_seen_subcommand_from logs' -a '(docker ps --format "{{.Names}}")' -f
complete -c docker -n '__fish_seen_subcommand_from exec' -a '(docker ps --format "{{.Names}}")' -f
complete -c docker -n '__fish_seen_subcommand_from stop' -a '(docker ps --format "{{.Names}}")' -f
complete -c docker -n '__fish_seen_subcommand_from restart' -a '(docker ps --format "{{.Names}}")' -f
complete -c docker -n '__fish_seen_subcommand_from rm' -a '(docker ps --format "{{.Names}}")' -f