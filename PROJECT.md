# Project Brief — Server Performance Stats

Source: https://roadmap.sh/projects/server-stats
Difficulty: beginner · Category: CLI

---

## The requirement

Write `server-stats.sh` that runs on any Linux server and reports:

1. Total CPU usage
2. Total memory usage — free vs used, with percentage
3. Total disk usage — free vs used, with percentage
4. Top 5 processes by CPU usage
5. Top 5 processes by memory usage

Stretch: OS version, uptime, load average, logged-in users, failed login attempts.

---

## Commands worth investigating

Not a recipe — these are the doors. Which ones you open is yours to decide.

| Area | Look at |
|---|---|
| CPU | `top -bn1`, `mpstat`, `/proc/stat`, `vmstat` |
| Memory | `free`, `/proc/meminfo` |
| Disk | `df`, `du` |
| Processes | `ps aux --sort=-%cpu`, `ps aux --sort=-%mem` |
| OS version | `/etc/os-release`, `uname -a`, `lsb_release` |
| Uptime / load | `uptime`, `/proc/loadavg`, `/proc/uptime` |
| Users | `who`, `w`, `last` |
| Failed logins | `lastb`, `journalctl -u ssh`, `/var/log/auth.log` |
| Arithmetic | `awk`, `bc`, bash `$(( ))` |

---

## The interesting problem

CPU usage is not a number sitting in a file waiting to be read. `/proc/stat` gives
you **cumulative counters** since boot — total jiffies spent in user, system, idle,
iowait, and so on.

So a single read tells you the average since the machine booted, which is not what
anyone means by "current CPU usage." Getting a meaningful number means sampling
twice, a short interval apart, and computing the delta.

`top -bn1` appears to hand you the answer directly. Look carefully at what its first
iteration actually reports and decide whether you trust it. There's a real tradeoff
here between simplicity and correctness — make the call deliberately and write down
why in the Notes section of the README.

---

## Engineering standards

These are the habits, and they matter more than the output:

- [ ] `#!/usr/bin/env bash` shebang
- [ ] `set -euo pipefail` at the top — know what each of the three does
- [ ] Every variable expansion quoted: `"$var"`
- [ ] Comment header: what it does, how to run it, what it assumes
- [ ] Functions for each section rather than one long top-to-bottom script
- [ ] Passes ShellCheck with zero warnings
- [ ] Degrades gracefully — if `lastb` isn't available, say so, don't crash

## Definition of done

- [ ] Runs clean on the Ubuntu VM
- [ ] All five required stats present and plausible
- [ ] Cross-checked against `htop` / `free -h` / `df -h` — the numbers agree
- [ ] ShellCheck clean
- [ ] README has real sample output pasted in
- [ ] Pushed to GitHub with a decent README
