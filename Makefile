.SILENT:

all: help

help: ## show targets
	@cat $(MAKEFILE_LIST) \
		| grep -i "^[a-z0-9_-]*: .*## .*" \
		| awk 'BEGIN {FS = ":.*?## "} \
		  {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

check: ## update manifests, run linters and update metadata
	find . -iname manifest -delete
	find . -type d -exec chmod 0755 {} \;
	find . -type f -exec chmod 0644 {} \;
	chmod 0755 .git/hooks/prepare-commit-msg
	repoman manifest
	repoman -dx full
	pkgcheck scan
	rm -rf metadata/md5-cache/
	git status

hooks: ## install pre-commit hooks
	pre-commit install --hook-type prepare-commit-msg

python_compat: ## search for PYTHON_COMPAT
	-grep --color=always --include='*.ebuild' -r ^PYTHON_COMPAT=

python_gen_cond_dep: ## search for python_gen_cond_dep
	-grep --color=always --include='*.ebuild' -r python_gen_cond_dep

python_usedep: ## search for missing PYTHON_USEDEP
	-grep --color=always --include='*.ebuild' -r dev-python/ * | grep -v PYTHON_USEDEP
