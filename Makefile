.SILENT:

check:
	find . -iname manifest -delete
	find . -type d -exec chmod 0755 {} \;
	find . -type f -exec chmod 0644 {} \;
	chmod 0755 .git/hooks/prepare-commit-msg
	repoman manifest
	repoman -dx full
	git status

hooks:
	pre-commit install --hook-type prepare-commit-msg

python_compat:
	grep --color=always -r ^PYTHON_COMPAT=

python_usedep:
	grep --color=always -r dev-python/ * | grep -v PYTHON_USEDEP
