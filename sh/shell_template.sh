#!/bin/sh

# shellcheck shell=dash

USAGE="Usage: $0 .....
"

# Default values
SOME_VAR=${SOME_VAR:="<default_value>"}

# Error messages
ERROR_MISSING_XXX='Error: missing xxx'

# logging functions
log() {
  printf '%s\n' "$1" >&2
}

error() {
  printf '%s\n' "$1"
  exit 1
}


# Argument parsing function
parse_arguments() {

  # parse command line options using getopt
  if ! options=$(getopt -o h --long help,<to be filled> -- "$@"); then
    error "$ERROR_PARSING"
  fi

  # set positional parameters
  eval set -- "$options"

  # Set default values for options
  xxx='yyy'

  # process options
  while true; do
    case $1 in
    <fill this>
    -h | --help)
      log "$USAGE"
      exit 0
      ;;
    --)
      shift
      break
      ;;
    *)
      error "$ERROR_PARSING"
      ;;
    esac
  done

  # REST OF THE FUNCTION
}

# main function
main() {
    # ...
}

# shellcheck disable=3028
if [ "$0" = "${BASH_SOURCE:-$0}" ]; then
  # Call the argument parsing function
  parse_arguments "$@"

  # call main function
  main "$xxx" "$yyyy"
fi
