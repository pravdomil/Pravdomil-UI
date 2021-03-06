#!/usr/bin/env bash

# Stop if any command fails.
set -e

# Stop on unset variables.
set -u

# Be in project root.
cd "${0%/*}/.."

# Have dependencies from npm ready.
npm i

# Have clean distribution directory.
rm -r dist || true
mkdir dist

# Compile application.
elm make src-cli/Main.elm --output dist/elm.js --optimize
elm-ffi dist/elm.js --run
curl --compressed https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/docs.json | node dist/elm.js > src/Element/PravdomilUi.elm
elm-format --yes src/Element/PravdomilUi.elm
