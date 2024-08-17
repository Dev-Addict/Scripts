#!/bin/bash

if [[ $# -gt 1 ]]; then
  echo "Error: Too many arguments"
  exit 1
elif [[ $# == 1 && ( $1 != "--push" && $1 != "-p" ) ]]; then
  echo "Error: Invalid arguments"
  exit 1
fi

success=$(eval "$(ssh-agent -s)" && ssh-add ~/.ssh/gh-rsa)

if [[ ! success ]]; then
  echo "Error: Failed to login to github via ssh"
  exit 1
fi

if [[ $1 == "--push" || $1 == "-p" ]]; then
  git push
fi

echo "Done!"
