#!/bin/bash

# CI/CD pipeline for a simple project
# when changes are detected in the associated Git repository.
# The script runs every hour via crontab.

## Variables

GIT_REPO_DIR="/path/to/folder"
GIT_REMOTE="origin"
GIT_BRANCH="main"
COMMANDS_TO_RUN="COMMAND TO RUN"

# Check for updates
cd "$GIT_REPO_DIR" || { echo "Failed to change to directory $GIT_REPO_DIR"; exit 1; }
git fetch "$GIT_REMOTE"

LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse "$GIT_REMOTE/$GIT_BRANCH")

if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
  git pull
  echo "New changes detected, updating repository..."
  
  # Check if git pull was successful
  if [ $? -eq 0 ]; then
    echo "Running commands..."
    eval "$COMMANDS_TO_RUN"
    if [ $? -eq 0 ]; then
      echo "Update and commands executed successfully."
    else
      echo "An error occurred while executing commands."
    fi
  else
    echo "An error occurred during git pull. Commands not executed."
  fi
else
  echo "No changes detected."
fi
