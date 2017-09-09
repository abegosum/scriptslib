# Copyright 2017 Aaron M. Bond
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


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
