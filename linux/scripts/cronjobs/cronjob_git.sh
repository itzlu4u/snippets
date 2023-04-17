#!/bin/bash

# Die CI/CD Pipeline des kleinen Mannes 
# Ich verwende dieses Script um eine Hugo seite neu zu bauen und in einen NGINX Docker Container zu laden. 
#  Wenn Änderungen im dazugeörigen GIT Repo vorhanden sind. Das Script läuft via Crontab jede Stunde. 


## Variables

GIT_REPO_DIR="/path/to/folder"
GIT_REMOTE="origin"
GIT_BRANCH="main"
COMMANDS_TO_RUN="COMAND TO RUN"

# Check for updates
cd "$GIT_REPO_DIR" || exit
git fetch "$GIT_REMOTE"

LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse "$GIT_REMOTE/$GIT_BRANCH")

if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
  eval git pull
  echo "New changes detected, updating repository..."
  
  # Check if git pull was successful
  if [ $? -eq 0 ]; then
    echo "Running commands..."
    eval "$COMMANDS_TO_RUN"
    echo "Update and commands executed successfully."
  else
    echo "An error occurred during git pull. Commands not executed."
  fi
else
  echo "No changes detected."
fi  

# 
