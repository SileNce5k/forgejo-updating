#!/bin/bash


set -e

VERSION=$1
FORGEJO_URL="https://codeberg.org/forgejo/forgejo/releases/download/v$VERSION/forgejo-$VERSION-linux-amd64"
echo Updating the forgejo instance to v$VERSION
OUTPUT_EXE=forgejo-v$VERSION
wget $FORGEJO_URL -O $OUTPUT_EXE
chmod +x $OUTPUT_EXE
sudo mv -v $OUTPUT_EXE /home/git/forgejo/forgejo
sudo systemctl restart forgejo
echo Update complete
