#!/bin/bash

mkdir -p state
mkdir -p share
XDG_STATE_HOME=./state XDG_DATA_HOME=./share XDG_CONFIG_HOME=./config nvim "$@"
