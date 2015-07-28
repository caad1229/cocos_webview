REPO_ROOT      := $(shell pwd)
USERPLATFORM    = $(shell uname)
DEPLOY_DIR      = $(REPO_ROOT)/deploy

#
# set platforms
#
PLATFORMS = android
ifeq ($(USERPLATFORM), Linux)
PLATFORMS += linux
endif
ifeq ($(USERPLATFORM), Darwin)
PLATFORMS += ios
endif

# common
REMOVE=rm -fr
JOB=-j 8
MAKE=cocos

default: all
all: $(PLATFORMS)

define PLATFORM_RULES
.PHONY: $(1)
$(1):
	@$(MAKE) run -p $(1) $(JOB)
deploy_$(1): FORCE
	@$(MAKE) deploy -p $(1) $(JOB)
package_$(1): FORCE
	@$(MAKE) package -p $(1) $(JOB)
build_$(1): FORCE
	@$(MAKE) compile -p $(1) $(JOB)
endef
$(foreach a,$(PLATFORMS),$(eval $(call PLATFORM_RULES,$(a))))


distclean:
	@echo "##### clean cocos ####"
	$(REMOVE) bin
	$(REMOVE) cocos2d/build/build
	$(REMOVE) cocos2d/cocos/platform/android/java/bin
	$(REMOVE) cocos2d/cocos/platform/android/java/gen
	$(REMOVE) cocos2d/cocos/platform/android/java/local.properties

clean_android:
	@echo "##### clean android ####"
	$(REMOVE) proj.android/assets
	$(REMOVE) proj.android/bin
	$(REMOVE) proj.android/gen
	$(REMOVE) proj.android/libs/armeabi
	$(REMOVE) proj.android/libs/x86
	$(REMOVE) proj.android/local.properties
	$(REMOVE) proj.android/obj

clean_ios:
	@echo "##### clean ios ####"
	$(REMOVE) proj.ios_mac/build

clean_linux:
	@echo "##### clean linux ####"
	$(REMOVE) linux-build

.PHONY: all android clean clean_android clean_ios clean_linux distclean
FORCE:

