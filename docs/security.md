# Security basics

- Start with LAN-only access: clients should connect over your home Wi-Fi to `http://HOST-LAN-IP:8096`.
- Do not forward TCP port 8096 from your router to the internet. For remote access, first research a maintained remote-access approach with TLS, authentication, and appropriate network controls.
- Use a unique Jellyfin password. Do not reuse your Google, Samsung, school, or GitHub password.
- Do not paste Jellyfin configuration files, database files, API keys, access tokens, or passwords into public issues or commits.
- Do not store media files or private Jellyfin data inside this repository.
- Guest Wi-Fi, public Wi-Fi, and shared networks may allow other users to reach devices on the same network. Use a trusted private network.
- Keep Termux and its packages updated, and install Termux only from a trusted distribution source.

The scripts do not create a Jellyfin user, set a password, configure router port forwarding, or expose the server to the internet.