#!/usr/bin/env bash
export ZBS="/ZBS"
export LUA_PATH="$ZBS/lualibs/?/?.lua;$ZBS/lualibs/?.lua;;"
export LUA_CPATH="$ZBS/bin/linux/x64/clibs/?.so;;"
resty --errlog-level="error" -j off "$@"
