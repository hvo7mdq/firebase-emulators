#!/bin/sh

export FIREBASE_TOKEN=1//0g7nYVZuLSZWOCgYIARAAGBASNwF-L9IrlKL3tdF4hlNRGIJ0YNbWGsZRcb_NsVE9V5QiGcwHgz0az-bAtIOwHG8NB_0lbnfNIpQ
export FIREBASE_PROJECT=appyheretest-b
sudo yarn firebase emulators:start --only auth,firestore,storage --import emulator-data --token ${FIREBASE_TOKEN} --project ${FIREBASE_PROJECT}

## FOR LOCAL ##
# sudo docker run -p 8080:8080 -p 9099:9099 -p 9199:9199 -p 4000:4000 -p 9150:9150 ghcr.io/rpanta00/emulator