#!/usr/bin/env bash

# exit on any error
set -e

# check for syntax error
molecule syntax

# lint with ansible-lint
molecule lint

# converge
molecule converge

# sleep for 10 seconds
sleep 10

# verify with inspec
echo "Checking inspec version..."
inspec --version

echo ""
echo "Running integration tests with inspec..."
echo ""
inspec exec --no-color test/smoke/default -t docker://xenial
inspec exec --no-color test/smoke/default -t docker://trusty
inspec exec --no-color test/smoke/default -t docker://precise

# clean up
molecule destroy
