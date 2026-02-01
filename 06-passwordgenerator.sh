#!/bin/bash

LENGTH=${1:-16}

PASSWORD=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+' < /dev/urandom | head -c "$LENGTH")

echo "Generated Password: $PASSWORD"
