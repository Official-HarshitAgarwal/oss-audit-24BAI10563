#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Harshit Agarwal | Reg: 24BAI10563
# Course: Open Source Software | Slot: D11
# Purpose: Inspect open-source packages and describe their philosophy

# --- List of packages to inspect ---
PACKAGES=("python3" "git" "curl" "vim")

echo "=================================================="
echo "        FOSS Package Inspector"
echo "=================================================="

# --- Loop through each package and check if installed ---
for PACKAGE in "${PACKAGES[@]}"; do

  echo ""
  echo "Checking: $PACKAGE"
  echo "--------------------------------------------------"

  # Check if the package exists using dpkg (Debian/Ubuntu)
  if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "Status  : INSTALLED"

    # Get version from dpkg output — field 3 of the dpkg -l line
    VERSION=$(dpkg -l "$PACKAGE" 2>/dev/null | grep "^ii" | awk '{print $3}')
    echo "Version : $VERSION"

  else
    # Package is not installed — report and continue loop
    echo "Status  : NOT INSTALLED"
    echo "Tip     : Run: sudo apt install $PACKAGE"
  fi

  # --- Case statement: print philosophy note based on package name ---
  case $PACKAGE in
    python3)
      echo "Philosophy: Python — a language built by community, for everyone."
      echo "            Guido van Rossum shared it freely so it could grow beyond"
      echo "            what any single person could build alone."
      ;;
    git)
      echo "Philosophy: Git — Linus Torvalds built this when a proprietary tool"
      echo "            failed him. Now the entire open-source world runs on it."
      ;;
    curl)
      echo "Philosophy: curl — a tiny tool that powers millions of APIs worldwide."
      echo "            Open source, maintained by volunteers, trusted by everyone."
      ;;
    vim)
      echo "Philosophy: Vim — a 30-year-old editor still actively maintained."
      echo "            Open source longevity at its finest."
      ;;
    *)
      echo "Philosophy: An open-source tool — study it, improve it, share it."
      ;;
  esac

done

echo ""
echo "=================================================="
echo "Inspection complete."
