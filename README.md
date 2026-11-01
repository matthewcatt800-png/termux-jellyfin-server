# Termux Jellyfin Server

Run a Jellyfin media server on Android using Termux.

## Overview
This project provides scripts and guidance for setting up Jellyfin on an Android phone or Wi-Fi tablet, using Termux as the host environment.

## Features
- Termux-based Jellyfin setup
- Startup helper scripts
- Android phone and tablet host guidance
- Local-network access from compatible clients

## Requirements
- Android device
- Termux
- A supported package environment and sufficient free storage
- A stable local Wi-Fi network for other devices to connect

## Start the server
From the repository directory, review the scripts and run the provided startup helper:

```bash
./scripts/start-jellyfin.sh
```

If execution is denied, check the script permissions and the setup instructions included in the repository. The exact package and storage requirements can change between Jellyfin releases.

## Access
Once the server reports that it is listening, open the address and port shown in its startup output from a browser or Jellyfin client on the same network.

## Notes
Android may restrict background activity. Keep the device powered and review battery-optimisation settings if the server stops while idle.

## Status
Compatibility depends on the Termux environment, Android version and Jellyfin packages.