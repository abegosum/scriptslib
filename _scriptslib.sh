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

SCRIPTLIB_SOURCE_LOCATION=$BASH_SOURCE

. _tools_setup.sh

# Swiss army knife of test functions-
# if the previous statement is non-zero,
# print the given statement and exit
function assert_success_or_die()
{
  local last_rc=$?
  local message=$1
  if [ "${last_rc}" != "0" ] ; then
    echo "${message}"
    exit $last_rc
  fi
}

# outputs the root directory of libs
function libs_dir()
{
  local_scriptlibs_root=`$DIRNAME_BIN "${SCRIPTLIB_SOURCE_LOCATION}"`
  echo "${local_scriptlibs_root}/libs"
}

# includes library scripts into current
# environment
function scriptslib_include()
{
  local library_to_include=$1
  dir_to_include=`libs_dir`
  if [ "${library_to_include}" != "" ] ; then 
    . "${dir_to_include}/_${library_to_include}.sh"
  else
    for libfile in ${dir_to_include}/_*.sh; do
      . "${libfile}"
    done
  fi
}

