#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
echo "bundle install executed successfully"
bundle exec rails assets:precompile
bundle exec rails assets:clean
