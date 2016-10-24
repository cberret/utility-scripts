#!/bin/bash

echo
echo -e "This script automatically sets up a Github repository from a local directory."
echo -e "It assumes that your account is set up for public key access from your local machine."
echo -e "As written, this scrpt will automatically create a public repo from a local directory."
echo -e "And I hope it goes without saying that you should not send anything private to Github!"
echo

# read -r -p "Would you like to proceed? (y/N): " choice
# case $choice in
#   [yY][eE][sS]|[yY] ) echo -e "Okay, setting up your repo.."
#   [nN][oO] ) echo -e "Got it. Quitting the script...";;
#   * ) echo "Invalid command. Quitting.";;
# esac
# echo

cd $1

echo
if (( $# != 3 )); then
  echo -e "Oops. This script requires three arguments: path to your local directory, github username, and the remote repo name."
  echo -e "Ex:     ./githubsetup.sh localdir username reponame"
  echo
  exit;
else echo "Sending the $1 directory to Github as a public repo..."
fi
echo

curl -u "$2" https://api.github.com/user/repos -d '{"name":"$3"}'

git init
git add . #adds all files in local directory
git commit -m "First commit."
git remote add origin git@github.com/$2/$3.git
git remote set-url origin git@github.com:$2/$3.git
git remote -v # verifies
git push -u origin master
