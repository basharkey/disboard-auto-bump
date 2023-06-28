# Disboard Bump
This playbook was designed to operate on a Debian 11 LXC. It will run the Discord client in a headless X session and automatically bump your server on Disboard every 124 minutes.

## Install
1. This app requires your Discord token in order to authenticate to the Discord client. You must obtain your `leveldb` directory and place it in the root of this directory. This guide assumes you have Discord installed as a Flatpak on a Linux host:

1. Delete any existing Discord configuration
```
rm -rf ~/.var/app/com.discordapp.Discord/
```

2. Run Discord to regernate the app directory
```
flatpak run com.discordapp.Discord
```

3. Login to Discord to generate a new token

4. Kill Discord
```
flatpak kill com.discordapp.Discord
```

5. Copy your Discord `leveldb` directory containing your token to the root of this repository
```
cp -r ~/.var/app/com.discordapp.Discord/config/discord/Local\ Storage/ ./
```

6. Delete your Discord configuration again to preserve your token (If you logout of the client your token will be invalidated)
```
rm -rf ~/.var/app/com.discordapp.Discord/
```

7. Update `hosts.yml`

8. Run `make install` to run the playbook
