# Termux Jellyfin Server

Run a Jellyfin media server on Android using Termux. This project focuses on an Android phone or Wi-Fi tablet acting as a small, LAN-only media server.

> Status: early-stage community setup notes. Termux package availability and Jellyfin runtime requirements can vary by device, architecture, and repository snapshot. Test package availability on the target device before relying on it.

## What is included

- `scripts/install-termux.sh` — installs the Termux packages used by this setup.
- `scripts/start-jellyfin.sh` — starts Jellyfin with Termux's web UI path and per-user data directories.
- `scripts/status.sh` — checks whether Jellyfin is listening on port 8096.
- `docs/tablet-host.md` — setup checklist for using an Android tablet as the host.
- `docs/security.md` — safe LAN-only setup and exposure warnings.

## Requirements

- Android device with a current Termux installation from a trusted source.
- ARM64 is the expected/tested target; other architectures may not have the same packages.
- Wi-Fi network shared with the devices that will watch media.
- Enough free storage for your media library.

## Quick start

First check package availability on the device:

```sh
pkg update && pkg search jellyfin && pkg search dotnet-runtime
```

If the packages required by the installer are available, clone and install:

```sh
pkg install -y git
 git clone https://github.com/matthewcatt800-png/termux-jellyfin-server.git
cd termux-jellyfin-server
chmod +x scripts/*.sh
./scripts/install-termux.sh
```

Start Jellyfin in the foreground:

```sh
./scripts/start-jellyfin.sh
```

On another device connected to the same Wi-Fi, open `http://ANDROID-DEVICE-IP:8096`. Replace the placeholder with the host device's LAN IP address. Follow Jellyfin's first-run wizard and create your own account credentials.

To find the host's IP, open Android Wi-Fi details or run `ip -br addr` if the command is available. The IP may change unless you reserve it in your router's DHCP settings.

## Media folders

The starter setup creates these folders under `~/jellyfin-media/`:

- `Movies/`
- `TV/`
- `Music/`

Add these folders as libraries in Jellyfin's setup wizard. Keep media files on your device or on storage that Termux can actually access.

## Important notes

- This is not an official Jellyfin project or a promise of upstream Android support.
- Keep Jellyfin LAN-only unless you understand reverse proxies, TLS, authentication, and firewalling. Do not simply forward port 8096 to the internet.
- Android may stop background processes to save battery. Read `docs/tablet-host.md`.
- Never commit media files, passwords, API keys, database files, or Jellyfin configuration into Git.
- If `pkg` cannot find a required package, do not run the installer yet; check the current Termux repositories and open an issue with the package-search output.

## License

MIT. See `LICENSE`.