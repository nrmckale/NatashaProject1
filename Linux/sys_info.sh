#!/bin/bash
echo "A quick system audit script: $(date)"

echo "machine type info:$MACHTYPE"
echo -e "uname info: $(uname -a) \n"
echo -e "IP info: $(ip addr | head -9 | tail -1) \n"
echo -e "IP info: $(hostname -I)\n"

uname

