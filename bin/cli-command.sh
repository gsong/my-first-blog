#!/bin/bash
set -e

GIT_CREDENTIAL_CACHE_TIMEOUT=${GIT_CREDENTIAL_CACHE_TIMEOUT:-$((12 * 60 * 60))}

git config --global user.name "${GITHUB_USERNAME}"
git config --global user.email "${GITHUB_EMAIL}"
git config --global credential.helper "cache --timeout=${GIT_CREDENTIAL_CACHE_TIMEOUT}"
git config --global push.default simple

if [ "${USER}" = root ]; then
  # If $USER is set to "root", which it will be when the host OS is Windows,
  # just run without changing users.
  exec /bin/bash
else
  adduser -u ${UID} -g "${GID}" -h /root -D "${USER}"
  exec su "${USER}" -c /bin/bash
fi

exit $?
