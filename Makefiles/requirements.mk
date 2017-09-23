# Tasks to be run inside app container

pip-compile:
	pip install --no-cache-dir -q pip-tools
	pip-compile

pip-compile-upgrade:
	pip install --no-cache-dir -q pip-tools
	pip-compile -U
