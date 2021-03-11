#! /bin/bash
# shellcheck disable=SC2012

set -euo pipefail
# shellcheck disable=SC1091
source ci/ci_helpers.sh

# We list all the .source files in alphabetical order, and do a substitution
# before writing the resulting file names that are created by those templates in
# relevant .gitignore files
#
# 1. Capture the file name without the .source extension
# 2. Add the desired extension at the end
# 3. Add a / character at the beginning of each line to conform to .gitignore file format
#
# e.g. multi_copy.source -> /multi_copy.sql
ls -1 src/test/regress/input | sed -E "s#(.*)\.source#/\1.sql#" > src/test/regress/sql/.gitignore

# e.g. multi_copy.source -> /multi_copy.out
ls -1 src/test/regress/output | sed -E "s#(.*)\.source#/\1.out#" > src/test/regress/expected/.gitignore
