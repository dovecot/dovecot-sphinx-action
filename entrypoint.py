#!/usr/bin/env python3

import os
import json
from sphinx_action import action

# This is the entrypoint called by Github when our action is run. All the
# Github specific setup is done here to make it easy to test the action code
# in isolation.
if __name__ == "__main__":
    print("[sphinx-action] Starting sphinx-action build.")
    if os.path.exists("source/man/Makefile"):
        action.prepare_manpages()
    action.build_everything()
