FROM cimg/node:18.19.0 as node-base

#update
RUN sudo apt update -y && sudo apt upgrade -y
#install yarn
RUN sudo mkdir /app
WORKDIR /app
COPY . .
#JRE
RUN sudo apt install openjdk-17-jre-headless -y
#
RUN sudo yarn install
#entrypoint
RUN sudo chmod a+x /app/entrypoint.sh

LABEL com.circleci.preserve-entrypoint=true
ENTRYPOINT /app/entrypoint.sh