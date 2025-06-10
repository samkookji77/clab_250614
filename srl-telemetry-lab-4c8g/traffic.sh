#!/bin/bash
# Copyright 2020 Nokia
# Licensed under the BSD 3-Clause License.
# SPDX-License-Identifier: BSD-3-Clause


set -eu

# Function to start traffic
start_traffic() {
    case $1 in
        "1-2")
            sudo docker exec client1 bash /config/iperf.sh
            ;;
        "2-1")
            sudo docker exec client2 bash /config/iperf.sh
            ;;
        "all")
            sudo docker exec client1 bash /config/iperf.sh
            sudo docker exec client2 bash /config/iperf.sh
            ;;
        *)
            echo "Invalid traffic pattern. Use 1-2, 2-1, or all"
            exit 1
            ;;
    esac
}

# Function to stop traffic
stop_traffic() {
    case $1 in
        "1-2")
            sudo docker exec client1 pkill iperf3
            ;;
        "2-1")
            sudo docker exec client2 pkill iperf3
            ;;
        "all")
            sudo docker exec client1 pkill iperf3
            sudo docker exec client2 pkill iperf3
            ;;
        *)
            echo "Invalid traffic pattern. Use 1-2, 2-1, or all"
            exit 1
            ;;
    esac
}

# Main script
case $1 in
    "start")
        start_traffic $2
        ;;
    "stop")
        stop_traffic $2
        ;;
    *)
        echo "Usage: $0 {start|stop} {1-2|2-1|all}"
        exit 1
        ;;
esac