#!/bin/bash
# Script 1: System Identity Report
# Author: Harshit Agarwal | Reg: 24BAI10563
# Course: Open Source Software | Slot: D11
# Purpose: Display a welcome screen with Linux system information

# --- Student and software variables ---
STUDENT_NAME="Harshit Agarwal"
REG_NUMBER="24BAI10563"
SOFTWARE_CHOICE="Python"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                         # Kernel version
USER_NAME=$(whoami)                        # Current logged-in user
HOME_DIR=$HOME                             # Home directory from env variable
UPTIME=$(uptime -p)                        # Human-readable uptime
CURRENT_DATE=$(date '+%d %B %Y %H:%M:%S') # Formatted date and time

# --- Get Linux distribution name from os-release file ---
# This file exists on all modern Linux distributions
DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')

# --- Display the system identity report ---
echo "=================================================="
echo "   Open Source Audit — System Identity Report"
echo "=================================================="
echo ""
echo "  Student  : $STUDENT_NAME ($REG_NUMBER)"
echo "  Software : $SOFTWARE_CHOICE"
echo "--------------------------------------------------"
echo "  Kernel   : $KERNEL"
echo "  User     : $USER_NAME"
echo "  Home     : $HOME_DIR"
echo "  Uptime   : $UPTIME"
echo "  Date     : $CURRENT_DATE"
echo "  Distro   : $DISTRO"
echo "--------------------------------------------------"
echo "  License  : Linux runs under GPL v2 — meaning"
echo "             anyone can study, modify, and"
echo "             redistribute this operating system."
echo "=================================================="
