#! /bin/bash

# ------------------------------------------------------------------------
# Print final git info
# ------------------------------------------------------------------------

cd $(dirname ${BASH_SOURCE[0]})

echo ''
(
    set -x
    git status
)
echo ''
(
    set -x
    git log -n1
)



