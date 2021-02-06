BIN                 := $(shell pwd)
APPLE_ID            ?= unity-sample-game
entitlements        ?= unity-sample-game.entitlements
DEV_ID              ?= "Developer ID Application: Donkey Kong (ABC1234567)"
APPLE_ID            ?= donkey.kong@icloud.com
GEN_PW              ?= abcd-efgh-ijkl-mnop
TEAM_ID             ?= ABC1234567
UNITY_BUNDLE_ID     ?= com.company.unity-sample-game

build:
	echo 'Change permissions in app 🔪'
	chmod -R a+xr $(APP).app
	codesign --deep --force --verify --verbose --timestamp --options runtime --entitlements $(ENTITLEMENT) --sign $(DEV_ID) $(APP).app
	ditto -c -k --sequesterRsrc --keepParent $(APP).app $(APP).zip
	xcrun altool --notarize-app --username $(APPLE_ID) --password $(GEN_PW) --asc-provider $(TEAM_ID) --primary-bundle-id $(UNITY_BUNDLE_ID) --file $(APP).zip --verbose

staple:
	xcrun stapler staple $(APP).app