# Unity Mac Notarization Build Tool

## Building & Notarizing with Makefile
You first need to build your app with the proper information and send to Apple's notary servers.

Ensure the Makefile is in the build folder with the proper assets. Then run:

```
make build
```
Replace user specific variables in Makefile accordingly (listed at top of file), use your own env variables or state them in the make command like this:
```
make build ENV_VAR=dkslaps
```

## Stapling with Makefile
With your app now notarized, Apple creates a ticket that you need to "staple" to the app.

```
make staple
```
Finally, to confirm, upload your app to the internet and download it. You should only see a simple prompt now warning that you've downloaded the file from the internet!

---

Reference can be found [here](https://gist.github.com/dpid/270bdb6c1011fe07211edf431b2d0fe4).