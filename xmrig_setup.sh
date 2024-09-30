#!/bin/bash

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# Install necessary dependencies
sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y

# Clone XMRig repository from GitHub
git clone https://github.com/xmrig/xmrig.git

# Change to XMRig directory
cd xmrig

# Create a build directory
mkdir build
cd build

# Build XMRig
cmake ..
make -j$(nproc)

# Create the config.json file
cat << EOF > config.json
{
    "api": {
        "id": null,
        "worker-id": null
    },
    "http": {
        "enabled": false,
        "host": "127.0.0.1",
        "port": 0,
        "access-token": null,
        "restricted": true
    },
    "autosave": true,
    "background": false,
    "colors": true,
    "title": true,
    "randomx": {
        "init": -1,
        "init-avx2": -1,
        "mode": "auto",
        "1gb-pages": false,
        "rdmsr": true,
        "wrmsr": true,
        "cache_qos": false,
        "numa": true,
        "scratchpad_prefetch_mode": 1
    },
    "cpu": {
        "enabled": true,
        "huge-pages": true,
        "huge-pages-jit": false,
        "hw-aes": null,
        "priority": null,
        "memory-pool": false,
        "yield": true,
        "asm": true,
        "argon2-impl": null,
        "argon2": [0, 2, 3],
        "cn": [
            [1, 0],
            [1, 2]
        ],
        "cn-heavy": [
            [1, 0]
        ],
        "cn-lite": [
            [1, 0],
            [1, 2],
            [1, 3]
        ],
        "cn-pico": [
            [2, 0],
            [2, 1],
            [2, 2],
            [2, 3]
        ],
        "cn/upx2": [
            [2, 0],
            [2, 1],
            [2, 2],
            [2, 3]
        ],
        "ghostrider": [
            [8, 0],
            [8, 2]
        ],
        "rx": [0, 1, 2, 3],
        "rx/arq": [0, 1, 2, 3],
        "rx/sfx": [1, 2],
        "rx/wow": [0, 2, 3],
        "cn-lite/0": false,
        "cn/0": false
    },
    "opencl": {
        "enabled": false,
        "cache": true,
        "loader": null,
        "platform": "AMD",
        "adl": true,
        "cn-lite/0": false,
        "cn/0": false
    },
    "cuda": {
        "enabled": false,
        "loader": null,
        "nvml": true,
        "cn-lite/0": false,
        "cn/0": false
    },
    "log-file": null,
    "donate-level": 1,
    "donate-over-proxy": 1,
    "pools": [
        {
            "algo": null,
            "coin": "XMR",
            "url": "xmr.2miners.com:2222",
            "user": "41epyepUFzFQr5MZASgxskXSNEzt2mqy6FpB6sXvJsq36SszdDCGhR7RcNLC5eJ9sCWUWd1uq7m8C3k1vX7K7ePYTxqqQ4E",
            "pass": "x",
            "rig-id": "MyRig",
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "sni": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        },
        {
            "algo": null,
            "coin": "XMR",
            "url": "pool.supportxmr.com:5555",
            "user": "41epyepUFzFQr5MZASgxskXSNEzt2mqy6FpB6sXvJsq36SszdDCGhR7RcNLC5eJ9sCWUWd1uq7m8C3k1vX7K7ePYTxqqQ4E",
            "pass": "x",
            "rig-id": "MyRig",
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "sni": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        },
        {
            "algo": null,
            "coin": "XMR",
            "url": "xmr.pool.minergate.com:45700",
            "user": "41epyepUFzFQr5MZASgxskXSNEzt2mqy6FpB6sXvJsq36SszdDCGhR7RcNLC5eJ9sCWUWd1uq7m8C3k1vX7K7ePYTxqqQ4E",
            "pass": "x",
            "rig-id": "MyRig",
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "sni": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        }
    ],
    "retries": 5,
    "retry-pause": 5,
    "print-time": 60,
    "health-print-time": 60,
    "dmi": true,
    "syslog": false,
    "tls": {
        "enabled": false,
        "protocols": null,
        "cert": null,
        "cert_key": null,
        "ciphers": null,
        "ciphersuites": null,
        "dhparam": null
    },
    "dns": {
        "ipv6": false,
        "ttl": 30
    },
    "user-agent": null,
    "verbose": 0,
    "watch": true,
    "pause-on-battery": false,
    "pause-on-active": false
}
EOF

# Start mining
cd build
./xmrig
