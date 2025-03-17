# Autocompletion for custom docker_stop_and_remove command in fish shell. The `-f` flag is used to force the completion.
complete -c docker_stop_and_remove -a '(docker ps --format "{{.Names}}")' -f