
# check for a global scope variable storing a 
# particular executable in the form of <NAME>_BIN
function bin_global_exists()
{
  local bin_name=$1
  local bin_global_name="${bin_name}_BIN"
  eval testval=\$${bin_global_name}
  if [ -z "${testval}" ] ; then
    return 1
  else
    return 0
  fi
}

# takes a global name and a list of potential binary locations
# the first matching binary location will be set to <Global name>_BIN
function set_bin_global_for()
{
  local bin_name=$1
  local bin_global_name="${bin_name}_BIN"
  if bin_global_exists $bin_name ; then
    return 0
  fi
  shift
  while test ${#} -gt 0 ; do
    current_bin_candidate=$1
    if [ -x ${current_bin_candidate} ]; then
      eval "${bin_global_name}=\"${current_bin_candidate}\""
      break
    fi
    shift
  done
  if ! bin_global_exists $bin_name  ; then
    echo "${FUNCNAME[0]} - ${testval} Unable to find a valid executable for ${bin_name}"
    return 1
  fi
}

# same as set_bin_global_for except will exit process on exit
function require_bin_global_for()
{
  set_bin_global_for "$@"
}

# Enter necessary tools here
require_bin_global_for AWK /usr/bin/awk /bin/awk
require_bin_global_for DATE /usr/bin/date /bin/date
require_bin_global_for DIRNAME /usr/bin/dirname /bin/dirname
