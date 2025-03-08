# The function generate_password is to generate a random password of a given length.
# If no length is given, the default length is 64. The function uses the openssl command to generate random bytes 
# and the tr command to remove newlines. The head command is used to limit the output to the desired length.
function generate_password
    set -l len 64
    if test (count $argv) -gt 0
        set len $argv[1]
    end
    
    set -l bytes (math "($len * 3 / 4) + 1")
    openssl rand -base64 $bytes | tr -d '\n' | head -c $len; echo
end