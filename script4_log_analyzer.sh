#!/bin/bash
# Script 4: Log File Analyzer
# Author: Harshit Agarwal | Reg: 24BAI10563
# Course: Open Source Software | Slot: D11
# Purpose: Analyze a log file and count keyword occurrences
# Usage: ./script4_log_analyzer.sh /path/to/logfile [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error

# --- Accept log file path as first argument ---
LOGFILE=$1

# --- Accept keyword as second argument, default to 'error' if not provided ---
KEYWORD=${2:-"error"}

# --- Counter to track how many matching lines we find ---
COUNT=0

# --- Validate: check that a filename was provided ---
if [ -z "$LOGFILE" ]; then
  echo "Usage: $0 <logfile> [keyword]"
  echo "Example: $0 /var/log/syslog error"
  exit 1
fi

# --- Validate: check that the file actually exists ---
if [ ! -f "$LOGFILE" ]; then
  echo "Error: File '$LOGFILE' not found."
  exit 1
fi

# --- Validate: check that the file is not empty ---
if [ ! -s "$LOGFILE" ]; then
  echo "Warning: File '$LOGFILE' exists but is empty."
  exit 0
fi

echo "=================================================="
echo "       Log File Analyzer"
echo "=================================================="
echo "File    : $LOGFILE"
echo "Keyword : '$KEYWORD'"
echo "--------------------------------------------------"

# --- Read the file line by line using a while loop ---
while IFS= read -r LINE; do

  # Check if the current line contains the keyword (case-insensitive)
  if echo "$LINE" | grep -iq "$KEYWORD"; then
    # Increment counter using arithmetic expansion
    COUNT=$((COUNT + 1))
  fi

done < "$LOGFILE"

# --- Print summary ---
echo ""
echo "Result  : Keyword '$KEYWORD' found $COUNT time(s)"
echo ""

# --- If matches found, show the last 5 matching lines ---
if [ "$COUNT" -gt 0 ]; then
  echo "Last 5 matching lines:"
  echo "--------------------------------------------------"
  grep -i "$KEYWORD" "$LOGFILE" | tail -5
fi

echo ""
echo "=================================================="
echo "Analysis complete."
