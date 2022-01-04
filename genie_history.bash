#!/bin/bash
cd ../mame
git log -p makefile scripts/{extlib.lua,genie.lua,toolchain.lua} scripts/src/3rdparty.lua scripts/src/osd/*
