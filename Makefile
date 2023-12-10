BIN                 := $(shell pwd)
APP                 ?= unity-sample-game
ENTITLEMENT         ?= unity-sample-game.entitlements
DEV_ID              ?= "Developer ID Application: Bowser (ABC1234567)"
APPLE_ID            ?= bowser@icloud.com
GEN_PW              ?= abcd-efgh-ijkl-mnop
TEAM_ID             ?= ABC1234567
UNITY_BUNDLE_ID     ?= com.company.unity-sample-game
REQUEST_UUID        ?= xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

codesign:
	chmod -R a+xr $(APP).app
	codesign --deep --force --verify --verbose --timestamp --options runtime --entitlements $(ENTITLEMENT) --sign $(DEV_ID) $(APP).app

zip:	
	ditto -c -k --sequesterRsrc --keepParent $(APP).app $(APP).zip

upload:
	xcrun notarytool submit --apple-id $(APPLE_ID) --team-id $(TEAM_ID) --password $(GEN_PW) $(APP).zip --wait

# must pass in SUB_ID (i.e. make SUB_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)
ping:
	xcrun notarytool info --apple-id $(APPLE_ID) --team-id $(TEAM_ID) --password $(GEN_PW) $(SUB_ID)

staple:
	xcrun stapler staple $(APP).app

check:
	spctl -a -v $(APP).app
