#!/bin/bash

# Default password length
DEFAULT_LENGTH=16

# Function to generate a password
generate_password() {
    local password_length=${1:-$DEFAULT_LENGTH}
    
    # Use /dev/urandom to generate a random password and format it using tr
    password=$(< /dev/urandom tr -dc 'A-Za-z0-9@#$%&*!?' | head -c${password_length})
    
    echo "Generated password: $password"
}

# Check if length is provided as an argument, otherwise use default
if [ "$1" ]; then
    generate_password $1
else
    generate_password
fi


