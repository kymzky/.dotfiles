#!/usr/bin/env bash
mkdir -p "$NOTES_PATH"
cd "$NOTES_PATH" || exit
nvim
cd - || exit
