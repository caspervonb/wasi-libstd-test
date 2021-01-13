#!/bin/bash
set -ueo pipefail

src_dir="src"
out_dir="out"

mkdir -p "$out_dir"

for input in "$src_dir"/*; do
  echo "Copying $input"
  cp $input "$out_dir/$(basename $input)"
done

for input in "$out_dir"/*.rs; do
  echo "Compiling $input"
  rustc --target=wasm32-wasi -o "$out_dir/$(basename $input .rs).wasm" "$input"
done
