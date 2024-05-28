#!/bin/bash

# Define the path to the passwd file
passwd_file="./passwd"

# Define the path to the new copy
new_passwd_file="./passwd_new"

# Check if the passwd file exists
if [ -f "$passwd_file" ]; then
    # Create an empty file named passwd_new
    cp "$passwd_file" "$new_passwd_file"

    # b. Change shell for user saned from /usr/sbin/nologin to /bin/bash using AWK
    awk -F: '$1 == "saned" { $7 = "/bin/bash" } { print }' OFS=: "$new_passwd_file" > temp && mv temp "$new_passwd_file"

    # c. Change shell for user avahi from /usr/sbin/nologin to /bin/bash using SED
    sed -i '/^avahi/s@/usr/sbin/nologin@/bin/bash@' "$new_passwd_file"

    # d. Save only 1st, 3rd, 5th, and 7th columns of each string based on : delimiter
    awk -F: '{print $1 ":" $3 ":" $5 ":" $7}' "$new_passwd_file" > temp && mv temp "$new_passwd_file"

    # e. Remove all lines from file containing word daemon
    grep -v "daemon" "$new_passwd_file" > temp && mv temp "$new_passwd_file"

    # f. Change shell for all users with even UID to /bin/zsh
    awk -F: '$2 % 2 == 0 { $4 = "/bin/zsh" } { print }' OFS=: "$new_passwd_file" > temp && mv temp "$new_passwd_file"

    # Remove the last newline character
    printf "%s" "$(cat "$new_passwd_file")" > temp && mv temp "$new_passwd_file"



    echo "Tasks completed successfully."
else
    echo "Error: passwd file not found."
fi
