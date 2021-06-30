#!/bin/bash
set -ueo pipefail

for input in *.rs; do
  echo "Compiling $input"
  rustc --target=wasm32-wasi -o "$(basename $input .rs).wasm" "$input"
done
