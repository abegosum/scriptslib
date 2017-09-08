
# Prints a log message with a formatted date prefix
# Arg1 - String - Message
function print_log() {
  local message=$1
  local date=`${DATE_BIN} +%Y-%m-%d:%H:%M:%S`
  echo -e "${date} : ${message}"
}

# Prefixes all stdin with formatted date prefix
function prefix_log {
  local date=`${DATE_BIN} +%Y-%m-%d:%H:%M:%S`
  local prefix="${date} : "
  local awk_script="{print \"${prefix}\"\$0}"
  echo -e "`${AWK_BIN} "${awk_script}"`"
}
