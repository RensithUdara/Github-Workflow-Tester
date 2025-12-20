#!/bin/bash
# random_commit.sh
# Generates random commits to simulate workflow logging

COMMITS=$(( ( RANDOM % 3 ) + 2 ))  # 2–4 commits per run
FILE="random.txt"

for ((i=1; i<=COMMITS; i++)); do
  echo "$(date '+%Y-%m-%d %H:%M:%S') | Random log entry: $RANDOM" >> "$FILE"
  git add "$FILE"
  git commit -m "Log entry #$i - $(date '+%H:%M:%S')"
  
  # Wait 30–300 seconds between commits
  SLEEP_TIME=$(( ( RANDOM % 270 ) + 30 ))
  echo "Sleeping for $SLEEP_TIME seconds..."
  sleep "$SLEEP_TIME"
done

git push origin main