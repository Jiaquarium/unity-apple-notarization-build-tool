# Unity Apple Notarization Build Tool
As of January 2020, all macOS Catalina+ apps are required to be notarized, meaning Unity builds now need to be notarized to distribute them on Mac (e.g. if sending the game directly to peeps). This helps automate those tasks.

## Notarizing & Stapling with Makefile
Ensure the Makefile is in the same directory as the proper entitlements and game app. Then run:

```
// Change permissions and codesign
make codesign

// Zip app
make zip

// Upload to Apple notarization service
make upload

// Check on status of upload
make ping

// Staple after upload status "Package Approved"
make staple

// Check stapled status
make check
```
Replace user specific variables in Makefile accordingly (listed at top of file), use your own env variables or state them in the make command like this:
```
make build ENV_VAR=value
```
---

Reference can be found [here](https://gist.github.com/dpid/270bdb6c1011fe07211edf431b2d0fe4).
