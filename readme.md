# Firebase emulators docker container designed for local testing as well as Circleci
## This suits Contains Following Firebase Services
- Firebase Authentication
- Firestore Database
- Firebase Storage

## Setup
### 1. Install node modules
```sh
    yarn
```
### 1. modify .firebaserc
```json
{
  "projects": {
    "default": "<projectId>"
  },
  "targets": {},
  "etags": {}
}

```
### 3. Generate Firebase CI Token
``` sh
    firebase login:ci
```
### 3. set Following in  emtrypoint.sh
```sh
    FIREBASE_TOKEN=<token from above process>
    FIREBASE_PROJECT=<projectId>
```

## Building Docker Image
```sh
    docker build . -t <your-tag>
```
## Running image locally
```sh
docker run -p 8080:8080 -p 9099:9099 -p 9199:9199 -p 4000:4000 -p 9150:9150 <your-tag>
```

## Services will run on following URI
- Dashboard [127.0.0.1:4000](http://127.0.0.1:4000)
- Auth [127.0.0.1:9099](http://127.0.0.1:9099)
- Firestore [127.0.0.1:8080](http://127.0.0.1:8080)
- Storage [127.0.0.1:9199](http://127.0.0.1:9199)

## CircleCI Implementation
### you need to push image to the repo before implementing on CircleCI
```yaml
version: 2.1
jobs:
  build:
    docker:
      - image: <your-image-repo>
```

## preload data
### If you ever need to preload data in the emulator you can override the command in entrypoint.sh as

```sh
sudo yarn firebase emulators:start \
 --only auth,firestore,storage \
 --import ${BACKUP_DATA_PATH} \
 --token ${FIREBASE_TOKEN} \
 --project ${FIREBASE_PROJECT}

```