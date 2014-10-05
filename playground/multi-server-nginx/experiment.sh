#!/bin/bash

export SCRIPT_LOCATION=$( dirname "${BASH_SOURCE[0]}" )

${SCRIPT_LOCATION}/server.py run a -p 5000 &
${SCRIPT_LOCATION}/server.py run a -p 5001 &
