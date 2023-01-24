#!/bin/sh

# conda env export --no-builds | grep -v "^prefix: " > environment.yaml
micromamba env export --no-build > environment.yaml