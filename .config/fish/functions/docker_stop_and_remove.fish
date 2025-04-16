# The function docker_stop_and_remove is to stop and remove a docker container. If a container name is given as an argument,
# the function stops and removes the container. If no argument is given, the function prints an error message.
function docker_stop_and_remove
    if test (count $argv) -gt 1
        echo "too many arguments were handed over"
    else if test (count $argv) -eq 1
        docker stop $argv[1] > /dev/null 2>&1
        docker rm $argv[1] > /dev/null 2>&1
        echo "$argv[1]"
    else
        echo "no container name given"
    end
end
