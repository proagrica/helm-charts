#!/usr/bin/env sh
set -eu

source_db_dir="/var/lib/clamav"

if [ -n "${DATABASE_DIRECTORY:-}" ] && [ "${DATABASE_DIRECTORY:-}" != "${source_db_dir}" ]
then
  for f in "${source_db_dir}"/*
  do
    if [ -f "${f}" ]
    then
      basename=$(basename "${f}")
      if [ ! -f "${DATABASE_DIRECTORY}/${basename}" ]
      then
        echo "Copying ${basename}"
        cp "${f}" "${DATABASE_DIRECTORY}"
      fi
    fi
  done
fi

exec freshclam --foreground --stdout
