#!/bin/bash

set -eux

source $(dirname $(readlink -f $0))/constants.sh

cd $(git rev-parse --show-toplevel)

setup_trap

git remote add upstream https://github.com/lxc/python3-lxc.git || true
git fetch upstream --tags

target_tag=$(git describe --tags upstream/$their_upstream_branch --match 'python3-lxc-*')
target_commit=$(git show-ref --tags -s -d "$target_tag")
git checkout $our_branch
git merge $target_commit
