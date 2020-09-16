#!/usr/bin/env bash

if [ -d "${RBENV_ROOT}/versions/cinc-workstation" ]; then
  cinc_workstation_ruby_exe="/opt/cinc-workstation/embedded/bin/ruby"
  cinc_workstation_ruby_lib_version=$("$cinc_workstation_ruby_exe" -e 'puts RbConfig::CONFIG["ruby_version"]')

  make_shims "${HOME}/.cincdk/gem/ruby/${cinc_workstation_ruby_lib_version}/bin/"*
  make_shims /opt/cinc-workstation/bin/*
  make_shims "/opt/cinc-workstation/embedded/lib/ruby/gems/${cinc_workstation_ruby_lib_version}/bin/"*

  make_shims ruby
  for i in /opt/cinc-workstation/embedded/bin/*; do
    if grep -qE '#!/opt/cinc-workstation/embedded/bin/ruby' "$i"; then
      make_shims "$i"
    fi
  done
fi
