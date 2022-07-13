.SILENT:

all: help

help: ## show targets
	@cat $(MAKEFILE_LIST) \
		| grep -i "^[a-z0-9_-]*: .*## .*" \
		| awk 'BEGIN {FS = ":.*?## "} \
		  {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

cloc: ## run cloc(1)
	cloc -force-lang="Bourne Again Shell,ebuild" .

check: ## update manifests, run linters and update metadata
	find . -iname manifest -delete
	find . -type d -exec chmod 0755 {} \;
	find . -type f -exec chmod 0644 {} \;
	chmod 0755 .git/hooks/prepare-commit-msg check_gentoo check_guru
	pkgdev manifest
	pkgcheck scan
	rm -rf metadata/md5-cache/
	git status

hooks: ## install pre-commit hooks
	pre-commit install --hook-type prepare-commit-msg

gentoo: ## search for duplicate ebuilds in ::gentoo
	./check_gentoo

guru: ## search for duplicate ebuilds in ::guru
	./check_guru
