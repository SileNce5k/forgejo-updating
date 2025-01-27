#!/bin/bash


set -e

VERSION=$1

FORGEJO_URL="https://code.forgejo.org/forgejo/runner/releases/download/v$VERSION/forgejo-runner-$VERSION-linux-amd64"
echo Updating the forgejo-runner to v$VERSION
OUTPUT_EXE=forgejo-runner-v$VERSION
wget $FORGEJO_URL -O $OUTPUT_EXE
chmod +x $OUTPUT_EXE
sudo systemctl stop forgejo-runner
sudo mv -v $OUTPUT_EXE /usr/local/bin/forgejo-runner
sudo systemctl start forgejo-runner
echo Update complete
