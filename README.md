
## XMRig Miner Setup

This guide will help you set up XMRig for mining Monero (XMR) automatically on Ubuntu.

### Quick Setup

Follow these commands to get started with XMRig:

```bash
sudo su
git clone https://github.com/rabinasiyam/Minier/
cd Minier
chmod +x xmrig_setup.sh
./xmrig_setup.sh
```

### What the Script Does

- Updates and upgrades the system
- Installs required dependencies for XMRig
- Clones the official XMRig repository
- Builds XMRig from source
- Creates a configuration file (`config.json`) with your Monero wallet address and preferred mining pools
- Automatically starts the mining process

For more detailed information about XMRig, visit the official [XMRig repository](https://github.com/xmrig/xmrig).
