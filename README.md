yoda-stories-docker
===================

Run the classic 1997 LucasArts game Yoda Stories via Docker. This means running this old, Windows-only game, on Linux and Mac!

Note: I haven't tested this on Linux, but... it's Docker.

As of 2019, this doesn't work anymore due to who knows what. But wine has actually become pretty easy to get running these days (copy/paste the following into a terminal):

```
brew install wine
curl -L -O https://github.com/kirbysayshi/yoda-stories-docker/raw/master/docker/yoda-stories.tgz
tar -xvf yoda-stories.tgz
cd YODA
wine YODESK.EXE
```

Requirements (Mac)
-----------

1. XQuartz (http://xquartz.macosforge.org/landing/)
2. Docker (https://docs.docker.com/installation/mac/)
3. socat (http://linux.die.net/man/1/socat) (via Homebrew http://brew.sh/)

Usage (Mac)
-----------

1. Clone this repo
2. Start XQuartz
3. In X11 preferences, check both boxes under the "Security" tab
4. in a terminal: `./start.sh`

The manual steps are basically:

1. Tell socat to forward from a socket to XQuartz:
  `socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"`
2. Build this Docker image
5. Start the container:
  `docker run -e DISPLAY=$(ipconfig getifaddr en1):0 -i -t kirbysayshi/yoda-stories-docker`

This repo comes with the Yoda Stories files. It's a secret to everybody.

Usage (Linux)
-------------

1. `docker run -i -t github.com/kirbsayshi/yoda-stories-docker`

Notes
-----

Sound doesn't work at the moment. It might on Linux with some effort, such as forwarding the sound devices with `-v /dev/snd` or sending the audio over a socket.

Inspiration / Thanks
--------------------

The X11 forwarding came from this excellent tutorial

- http://kartoza.com/how-to-run-a-linux-gui-application-on-osx-using-docker/

Which seem to come from this GH comment:

- https://github.com/docker/docker/issues/8710#issuecomment-71113263

Thanks to Zachtronics for an excellent article that reminded me of this game: http://www.zachtronics.com/yoda-stories/

Thanks to LucasArts for making this game that is a memorable part of my childhood, and was definitely ahead of its time. Have you all seen how many rogue-like-likes are around these days!?
