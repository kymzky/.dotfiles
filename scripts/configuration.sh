#!/usr/bin/env bash
dir=$(dirname $(realpath $0))
cd $dir/..
nvim
cd -
