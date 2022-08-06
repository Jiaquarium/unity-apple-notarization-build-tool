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
	xcrun altool --notarize-app --username $(APPLE_ID) --password $(GEN_PW) --asc-provider $(TEAM_ID) --primary-bundle-id $(UNITY_BUNDLE_ID) --file $(APP).zip --verbose

ping:
	xcrun altool --notarization-info $(REQUEST_UUID) --username $(APPLE_ID) --password $(GEN_PW) --asc-provider $(TEAM_ID)	

staple:
	xcrun stapler staple $(APP).app

check:
	spctl -a -v $(APP).app
