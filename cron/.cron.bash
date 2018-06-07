#!/bin/bash

source .bashrc

# Restore SHELL env var for cron
SHELL=/bin/bash

# execute the cron command in an actual shell
exec /bin/bash --norc "$@"
