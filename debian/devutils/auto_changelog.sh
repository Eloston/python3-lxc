#!/bin/bash

# Updates debian/changelog during a rebase

set -eux

cd $(git rev-parse --show-toplevel)

trap popd SIGINT

git checkout --theirs -- debian/changelog
TZ=Etc/UTC DEBFULLNAME=Eloston DEBEMAIL=eloston@programmer.net dch --allow-lower-version '1:*' -v "1:$(dpkg-parsechangelog --show-field Version)" -D UNRELEASED 'Debianize'
TZ=Etc/UTC DEBFULLNAME=Eloston DEBEMAIL=eloston@programmer.net dch --bpo ''
git add debian/changelog
