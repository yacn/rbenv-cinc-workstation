#!/usr/bin/env bash

if [[ $RBENV_VERSION == cinc-workstation ]]; then
  if [ ! -x "$RBENV_COMMAND_PATH" ]; then
    cinc_workstation_ruby_exe="/opt/cinc-workstation/embedded/bin/ruby"
    cinc_workstation_ruby_lib_version=$("$cinc_workstation_ruby_exe" -e 'puts RbConfig::CONFIG["ruby_version"]')
    if [ -x "${HOME}/.cincdk/gem/ruby/${cinc_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="${HOME}/.cincdk/gem/ruby/${cinc_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/cinc-workstation/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/cinc-workstation/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/cinc-workstation/embedded/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/cinc-workstation/embedded/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/cinc-workstation/embedded/lib/ruby/gems/${cinc_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/cinc-workstation/embedded/lib/ruby/gems/${cinc_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}"
    fi
  fi
fi
