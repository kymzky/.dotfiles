#!/usr/bin/env bash

if command -v apt &> /dev/null; then
  sudo apt update && sudo apt upgrade -y
fi

if command -v dnf &> /dev/null; then
  sudo dnf upgrade -y
fi

if command -v brew &> /dev/null; then
  brew update && brew upgrade
fi
