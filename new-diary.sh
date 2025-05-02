#!/bin/bash

# Get today's date parts
YEAR=$(date +"%Y")
MONTH=$(date +"%B")    # Full month name like "April"
DAY=$(date +"%d-%m-%Y")

# Folder structure: 2025/April/
FOLDER="$YEAR/$MONTH"
FILE="$FOLDER/$DAY.md"

# Template content
TEMPLATE="# Daily Checklist - $DAY

- [ ] Daily Leetcode  
- [ ] Read one Medium Low level design (blog)  
- [ ] Read or find one success story to join MAANG company as a fresher and saved to notion

**Day in one emoji**:  
**Today goal**:  
**Achieved**:  
**Day summary**:  
**Things I did**:  
"

# Create the directory if it doesn't exist
mkdir -p "$FOLDER"

# Write to the file
echo "$TEMPLATE" > "$FILE"

# Git commands to add, commit, and push (only if there are changes)
git add "$FILE"

# Check if there are any changes to commit
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "feat(diary): add new markdown entry for $DAY with checklist"
  git push origin main
fi

# Open in VS Code (optional)
code "$FILE"
