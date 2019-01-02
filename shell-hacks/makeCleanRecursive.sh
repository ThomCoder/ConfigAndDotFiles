#!/bin/bash
find "$(pwd)" -name Makefile | while read -r line; do cd "$(dirname "$line")" && make clean; done
exit $?
