BUILD_DIR = $(VAR_DIR)/build
NODE_DIR = node_modules
NODE_BIN_DIR = $(NODE_DIR)/.bin
SRC_DIR = src
VAR_DIR = var


.PHONY: all
all: init check build


.PHONY: auth
auth:
	$(NODE_BIN_DIR)/gapps auth client_secret.json


BUILD_JS_FILES = $(subst $(SRC_DIR), $(BUILD_DIR), $(wildcard $(SRC_DIR)/*.js)) $(BUILD_DIR)/gas-tap-lib.js
.PHONY: build
build: $(BUILD_JS_FILES)
	$(NODE_BIN_DIR)/webpack

$(BUILD_DIR)/gas-tap-lib.js: vendor/gast/src/gas-tap-lib.js
	@mkdir -p $(dir $@)
	cp $< $@

$(BUILD_DIR)/%.js: $(SRC_DIR)/%.js
	@mkdir -p $(dir $@)
	cp $< $@


.PHONY: check
check: check-lint

.PHONY: check-lint
check-lint:
	$(NODE_BIN_DIR)/eslint src *.js


.PHONY: clean
clean:
	rm -rf $(VAR_DIR)

.PHONY: distclean
distclean: clean
	rm -rf $(NODE_DIR)


.PHONY: deploy
deploy:
	$(NODE_BIN_DIR)/gapps upload


.PHONY: init
init: $(NODE_DIR)

$(NODE_DIR):
	yarn
