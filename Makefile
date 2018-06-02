RELEASE_MESSAGE = "Version %s"

.PHONY: install
install:
	rm -rf node_modules
	npm install

.PHONY: test
test:
	npm test

.PHONY: build
build:
	npm run build

# Release package with specified number MAJOR.MINOR.PATCH
.PHONY: release
release:
	npm version $(VERSION) -m $(RELEASE_MESSAGE)
	git push && git push --tags

# Release packege with bumped major version
.PHONY: release-major
release-major:
	npm version major -m $(RELEASE_MESSAGE)
	git push && git push --tags

# Release packege with bumped minor version
.PHONY: release-minor
release-minor:
	npm version minor -m $(RELEASE_MESSAGE)
	git push && git push --tags

# Release packege with bumped patch version
.PHONY: release-patch
release-patch:
	npm version patch -m $(RELEASE_MESSAGE)
	git push && git push --tags

.PHONY: clean
clean:
	rm -rf node_modules .rpt2_cache dist

default: build