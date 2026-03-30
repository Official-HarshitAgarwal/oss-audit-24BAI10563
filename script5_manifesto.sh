#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Harshit Agarwal | Reg: 24BAI10563
# Course: Open Source Software | Slot: D11
# Purpose: Generate a personalised open-source philosophy statement
# Alias note: add this to ~/.bashrc to run as 'mymotto':
#   alias mymotto='bash ~/script5_manifesto.sh'

echo "=================================================="
echo "    Open Source Manifesto Generator"
echo "=================================================="
echo ""
echo "Answer three questions. Your manifesto will be saved to a file."
echo ""

# --- Read answers from the user interactively ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Get the current date in a readable format ---
DATE=$(date '+%d %B %Y')

# --- Set the output filename using the current username ---
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "--------------------------------------------------"
echo "Generating your manifesto..."
echo "--------------------------------------------------"
echo ""

# --- Write the header to the file (> overwrites any existing file) ---
echo "Open Source Manifesto — $(whoami)" > "$OUTPUT"
echo "Generated on: $DATE" >> "$OUTPUT"
echo "================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Compose and write the personalised paragraph using >> to append ---
echo "I believe in open source because every day I rely on $TOOL" >> "$OUTPUT"
echo "to do things I could not easily do alone. To me, freedom" >> "$OUTPUT"
echo "in software means $FREEDOM — the ability to look inside a tool," >> "$OUTPUT"
echo "understand it, and improve it without asking anyone's permission." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "One day I want to build $BUILD and share it freely with the world." >> "$OUTPUT"
echo "Not because I have to, but because that is what this community" >> "$OUTPUT"
echo "taught me: that the best tools grow when more hands shape them." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Standing on the shoulders of giants — and reaching higher." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "                              — Harshit Agarwal, $DATE" >> "$OUTPUT"
echo "================================================" >> "$OUTPUT"

# --- Display the saved manifesto ---
echo "Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"

echo ""
echo "=================================================="
echo "Done. Find your manifesto in the current directory."
