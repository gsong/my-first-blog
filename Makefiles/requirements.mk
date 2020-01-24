# Tasks to be run inside app container

pip-compile:
	pip install --no-cache-dir -q pip-tools
	pip-compile
	pip-compile dev.in

pip-compile-upgrade:
	pip install --no-cache-dir -q pip-tools
	pip-compile -U
	pip-compile -U dev.in
