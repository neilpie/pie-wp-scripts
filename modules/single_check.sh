#!/bin/bash


if [[ $single_or_multi = "multi" ]]; then
  echo "You are trying to run a script for multi installations. Please run the single version" 
  exit 1
fi
