#!/usr/bin/env bash
#
# server-stats.sh — report basic performance statistics for a Linux server
#
# Usage:   ./server-stats.sh
# Assumes: Linux with a standard /proc filesystem
# Author:  Donovan Carr
#
# See PROJECT.md for requirements.

set -euo pipefail

# ─────────────────────────────────────────────────────────────────────
# TODO: this is a skeleton. Fill in each function.
# Run `shellcheck server-stats.sh` as you go.
# ─────────────────────────────────────────────────────────────────────

print_header() {
    # TODO: print a title / separator so output is readable
    :
}

cpu_usage() {
    # TODO: total CPU usage as a percentage
    # See PROJECT.md — "The interesting problem"
    :
}

memory_usage() {
    # TODO: used vs free, with percentage
    :
}

disk_usage() {
    # TODO: used vs free, with percentage
    :
}

top_cpu_processes() {
    # TODO: top 5 by CPU
    :
}

top_memory_processes() {
    # TODO: top 5 by memory
    :
}

main() {
    print_header
    cpu_usage
    memory_usage
    disk_usage
    top_cpu_processes
    top_memory_processes
}

main "$@"
