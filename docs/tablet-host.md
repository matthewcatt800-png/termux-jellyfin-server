# Using an Android tablet as the Jellyfin host

These steps are intended for a non-rooted Android tablet. They are a checklist, not a guarantee that Jellyfin packages are available for every tablet or Termux repository snapshot.

## 1. Prepare Termux

Install Termux from a trusted source and open it on the tablet. Then run:

```sh
pkg update -y && pkg upgrade -y && pkg install -y git curl wget nano tmux
uname -m && getprop ro.build.version.release && getprop ro.product.model
pkg search jellyfin && pkg search dotnet-runtime
```

Check the search output before installing. The current project installer expects `jellyfin-server`, `dotnet-runtime-10.0`, `jellyfin-ffmpeg`, `ffmpeg`, and `libskiasharp`. If any are missing, stop and investigate package support instead of forcing an install.

## 2. Install the project

Only continue if the package checks show the required packages:

```sh
git clone https://github.com/matthewcatt800-png/termux-jellyfin-server.git
cd termux-jellyfin-server
chmod +x scripts/*.sh
./scripts/install-termux.sh
```

## 3. Start and finish setup

```sh
./scripts/start-jellyfin.sh
```

Leave this terminal session open for the first test. On a second device on the same Wi-Fi, open `http://TABLET-LAN-IP:8096` and follow the first-run wizard. Create a unique password and add the relevant folders from `~/jellyfin-media/` as libraries.

Find the tablet's LAN IP in Android Settings → Connections → Wi-Fi → current network details. Reserve the address in your router if you want it to stay stable.

## 4. Keep the tablet available

- Keep the tablet connected to power and Wi-Fi during testing.
- In Android Settings → Apps → Termux → Battery, choose the least restrictive available battery option. Exact wording varies by One UI version.
- In Termux, run `termux-wake-lock` if the Termux:API package is installed and the command is available. Release later with `termux-wake-unlock`.
- Test after the screen turns off and after a reboot. Android may still stop the process; a foreground Termux session is the simplest baseline.
- Do not disable random Android system packages or security controls to keep the server alive.

## 5. Check it

In a second Termux session:

```sh
cd ~/termux-jellyfin-server && ./scripts/status.sh
```

If the package search cannot find Jellyfin or the runtime, report the tablet's `uname -m`, Android version, and the exact `pkg search` output. Do not include passwords, tokens, or private media details.