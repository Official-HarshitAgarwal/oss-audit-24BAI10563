# OSS Audit — Python
### Open Source Software Capstone Project | VITyarthi

---

## Student Details

| Field | Details |
|---|---|
| **Student Name** | Harshit Agarwal |
| **Registration Number** | 24BAI10563 |
| **Slot** | D11 |
| **Course** | Open Source Software (OSS NGMC) |
| **Software Audited** | Python (PSF License) |

---

## About This Project

This repository contains the five shell scripts submitted as part of the Open Source Audit capstone project. The project involves a structured audit of Python — one of the most widely used open-source programming languages in the world — covering its origin story, license analysis, ethical dimensions, Linux footprint, FOSS ecosystem, and a comparison against its proprietary alternative (MATLAB).

The full written report (PDF) has been submitted separately on the VITyarthi portal.

---

## Repository Structure

```
oss-audit-24BAI10563/
│
├── README.md                        ← This file
├── script1_system_info.sh           ← System Identity Report
├── script2_package_inspector.sh     ← FOSS Package Inspector
├── script3_disk_auditor.sh          ← Disk and Permission Auditor
├── script4_log_analyzer.sh          ← Log File Analyzer
└── script5_manifesto.sh             ← Open Source Manifesto Generator
```

---

## Script Descriptions

### Script 1 — System Identity Report (`script1_system_info.sh`)
Displays a formatted welcome screen showing key information about the Linux system including the kernel version, logged-in user, home directory, system uptime, distribution name, current date and time, and the open-source license that governs the operating system.

**Concepts used:** Variables, command substitution `$()`, `echo` formatting, reading from `/etc/os-release`

---

### Script 2 — FOSS Package Inspector (`script2_package_inspector.sh`)
Checks whether Python and three other open-source packages (git, curl, vim) are installed on the system. For each installed package it retrieves the version number, then uses a `case` statement to print a short philosophy note about the purpose and values behind each package.

**Concepts used:** `if-then-else`, `for` loop, `case` statement, `dpkg -l`, pipe with `grep` and `awk`

---

### Script 3 — Disk and Permission Auditor (`script3_disk_auditor.sh`)
Loops through a list of important Linux system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/usr/lib`) and reports the permissions, owner, group, and disk usage of each. Also specifically checks whether Python's library directory exists and reports its properties.

**Concepts used:** `for` loop with array, `[ -d ]` directory check, `ls -ld` with `awk`, `du -sh` with `cut`, `printf` for column formatting

---

### Script 4 — Log File Analyzer (`script4_log_analyzer.sh`)
Accepts a log file path and an optional keyword (defaults to `error`) as command-line arguments. Reads the file line by line, counts how many lines contain the keyword (case-insensitive), and prints the last 5 matching lines. Handles missing files and empty files gracefully.

**Concepts used:** `$1` and `$2` arguments, `${VAR:-default}` default values, `[ ! -f ]` file validation, `while IFS= read -r` loop, `$(( ))` arithmetic, `grep -i`, `tail`

---

### Script 5 — Open Source Manifesto Generator (`script5_manifesto.sh`)
An interactive script that asks the user three questions about their relationship with open-source software, then composes a personalised philosophy statement using their answers and saves it to a `.txt` file named after the current user. The manifesto is displayed immediately after saving.

**Concepts used:** `read -p` for interactive input, string variables and concatenation, `>` and `>>` for file writing, `date` command, `cat` to display output, alias concept (commented)

---

## Dependencies

All scripts run on a standard Linux system with no additional packages required beyond what is installed by default on Ubuntu 22.04 LTS.

| Dependency | Purpose | Check |
|---|---|---|
| `bash` | Shell interpreter | `bash --version` |
| `python3` | Required for Script 2 inspection | `python3 --version` |
| `dpkg` | Package querying (Scripts 2) | Pre-installed on Ubuntu |
| `coreutils` | `du`, `ls`, `cut`, `awk`, `date` | Pre-installed on Ubuntu |
| `grep` | Keyword matching (Script 4) | Pre-installed on Ubuntu |

---

## How to Run — Step by Step

### Step 1 — Clone the repository
```bash
git clone https://github.com/Official-HarshitAgarwal/oss-audit-24BAI10563.git
cd oss-audit-24BAI10563
```

### Step 2 — Make all scripts executable
```bash
chmod +x script*.sh
```

### Step 3 — Run each script

**Script 1**
```bash
./script1_system_info.sh
```

**Script 2**
```bash
./script2_package_inspector.sh
```

**Script 3**
```bash
./script3_disk_auditor.sh
```

**Script 4**
```bash
# With a real log file
./script4_log_analyzer.sh /var/log/syslog error

# Or with a test file if syslog is unavailable
echo "test error line" > test.log
./script4_log_analyzer.sh test.log error
```

**Script 5**
```bash
./script5_manifesto.sh
# Answer the three prompts interactively
# Output is saved to: manifesto_[yourusername].txt
```

---

## Tested On

- Ubuntu 22.04 LTS (via WSL2 on Windows 11)
- Bash 5.1.16

---

## License

This project is submitted for academic evaluation under VITyarthi's Open Source Software course. The shell scripts are original work by Harshit Agarwal (24BAI10563).
