#!/usr/bin/env bash

if command -v dnf &> /dev/null; then
  sudo dnf upgrade -y
fi

if command -v brew &> /dev/null; then
  brew update
fi
