#!/bin/bash
set -e

GIT_CREDENTIAL_CACHE_TIMEOUT=${GIT_CREDENTIAL_CACHE_TIMEOUT:-$((12 * 60 * 60))}

git config --global user.name "${GITHUB_USERNAME}"
git config --global user.email "${GITHUB_EMAIL}"
git config --global credential.helper "cache --timeout=${GIT_CREDENTIAL_CACHE_TIMEOUT}"
git config --global push.default simple

exec /bin/bash
