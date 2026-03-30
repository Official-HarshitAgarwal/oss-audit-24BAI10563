#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Harshit Agarwal | Reg: 24BAI10563
# Course: Open Source Software | Slot: D11
# Purpose: Audit system directories for permissions and disk usage

# --- Array of important directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib")

echo "=================================================="
echo "       Disk and Permission Audit Report"
echo "=================================================="
echo ""
printf "%-20s %-25s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "--------------------------------------------------"

# --- Loop through each directory ---
for DIR in "${DIRS[@]}"; do

  # Check if the directory actually exists on this system
  if [ -d "$DIR" ]; then
    # Extract permissions and owner/group using ls and awk
    PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

    # Get human-readable disk usage, suppress permission errors
    SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

    # Print formatted output
    printf "%-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
  else
    printf "%-20s %s\n" "$DIR" "DOES NOT EXIST on this system"
  fi

done

echo ""
echo "--------------------------------------------------"
echo "Python Library Directory Check"
echo "--------------------------------------------------"

# --- Check for Python's library directory specifically ---
PYTHON_LIB=$(ls -d /usr/lib/python3* 2>/dev/null | head -1)

if [ -n "$PYTHON_LIB" ]; then
  echo "Found   : $PYTHON_LIB"
  PERMS=$(ls -ld "$PYTHON_LIB" | awk '{print $1, $3, $4}')
  SIZE=$(du -sh "$PYTHON_LIB" 2>/dev/null | cut -f1)
  echo "Perms   : $PERMS"
  echo "Size    : $SIZE"
  echo "Note    : This directory contains Python's standard library."
  echo "          It is owned by root to prevent accidental modification."
else
  echo "Python library directory not found. Is Python installed?"
fi

echo ""
echo "=================================================="
echo "Audit complete."
