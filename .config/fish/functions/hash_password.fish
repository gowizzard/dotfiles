# The function hash_password takes a password as an argument and returns the hashed password.
# The hashed password is generated using the htpasswd command with the -B flag.
# The -B flag specifies that the password should be hashed using the bcrypt algorithm.
# The function uses a temporary file to store the hashed password and then extracts the hashed password from the file.
# The function returns the hashed password and deletes the temporary file.
function hash_password
    if test -z $argv
        echo "Usage: password_hash <password>"
        return 1
    end

    set -l tmpfile (mktemp)
    htpasswd -cb -B $tmpfile "user" $argv[1] > /dev/null 2>&1
    string split ":" (cat $tmpfile)[1] | tail -n 1

    rm $tmpfile
end
