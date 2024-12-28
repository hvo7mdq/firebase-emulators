#!/bin/sh

export FIREBASE_TOKEN=<your-token>
export FIREBASE_PROJECT=<your-project-id>
sudo yarn firebase emulators:start --only auth,firestore,storage --token ${FIREBASE_TOKEN} --project ${FIREBASE_PROJECT}
