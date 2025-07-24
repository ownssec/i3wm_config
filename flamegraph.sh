#!/bin/bash

mkdir -p ~/flamegraph_output
cd ~/flamegraph_output

perf record -F 99 -a -g -- sleep 10
perf script > out.perf
stackcollapse-perf.pl out.perf > out.folded
flamegraph.pl out.folded > flamegraph.svg
xdg-open flamegraph.svg


