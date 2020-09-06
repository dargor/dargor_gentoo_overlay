check:
	find . -iname manifest -delete
	find . -type d -exec chmod 0755 {} \;
	find . -type f -exec chmod 0644 {} \;
	repoman manifest
	repoman -dx full
	git status

python_compat:
	grep -r ^PYTHON_COMPAT=
