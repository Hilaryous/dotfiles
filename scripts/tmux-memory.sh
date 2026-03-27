#!/bin/bash
used=$(vm_stat | awk '/page size of/{s=$8} /Pages active:/{a=$3} /Pages wired down:/{w=$4} END{printf "%.1f", (a+w)*s/1073741824}')
total=$(sysctl -n hw.memsize | awk '{printf "%.0f", $1/1073741824}')
echo "${used}G/${total}G"
