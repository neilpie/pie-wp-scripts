#!/bin/bash


if [[ $single_or_multi = "single" ]]; then
  echo "You are trying to run a script for single installations. Please run the multi version" 2>&1
  exit 1
fi
