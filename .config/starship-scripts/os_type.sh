#!/usr/bin/sh
if [ -n "$WSL_DISTRO_NAME" ]; then
  echo " (WSL)"
elif [ "$(uname)" = "Darwin" ]; then
  echo ""
else
  echo ""
fi
