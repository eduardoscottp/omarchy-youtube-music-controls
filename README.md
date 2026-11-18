# YouTube Music Controls for Omarchy

Your music belongs in the flow, not in the way. Put previous, play/pause, next,
and the current track directly in the Omarchy bar; keep the soundtrack going
while you tuck the YouTube Music window out of sight and reclaim your screen.

The companion `Super + Y` workflow can bring the player forward when you want
the full YouTube Music experience, then hide it again while playback continues
quietly in the background.

## Install

```bash
omarchy plugin add https://github.com/eduardoscottp/omarchy-youtube-music-controls.git --enable
```

Open `music.youtube.com` in a Chromium-based browser and start playback. The plugin uses Omarchy's built-in MPRIS service; it does not read accounts, store data, make network requests, or execute shell commands.

## Remove

```bash
omarchy plugin remove eduardoscottp.youtube-music-controls --yes
```

## License

MIT
