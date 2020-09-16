#!/usr/bin/env bash

# Run shell-init for POSIX shell so that we have the correct PATHs, etc.
# We don't care about the completion so a POSIX shell init is  enough.
if [[ $RBENV_VERSION == cinc-workstation ]]; then
  # check for cinc-cli, which was renamed from cinc binary starting workstation v0.10.41
  if [ -x "/opt/cinc-workstation/bin/cinc-cli" ]; then
    eval "$(/opt/cinc-workstation/bin/cinc-cli shell-init sh)"
  else
    eval "$(/opt/cinc-workstation/bin/cinc shell-init sh)"
  fi
fi
