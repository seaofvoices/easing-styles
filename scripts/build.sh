#!/bin/sh

set -e

scripts/build-single-file.sh .darklua-bundle.json build/easing-styles.luau
scripts/build-single-file.sh .darklua-bundle-dev.json build/debug/easing-styles.luau
scripts/build-roblox-model.sh .darklua.json build/easing-styles.rbxm
scripts/build-roblox-model.sh .darklua-dev.json build/debug/easing-styles.rbxm
