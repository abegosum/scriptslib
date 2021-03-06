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


# Color Codes
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
COLOR_NONE='\033[0m'
COLOR_BLACK='\033[0;30m'
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_BROWN='\033[0;33m'
COLOR_ORANGE='\033[0;33m'
COLOR_BLUE='\033[0;34m'
COLOR_PURPLE='\033[0;35m'
COLOR_CYAN='\033[0;36m'
COLOR_LIGHT_GRAY='\033[0;37m'
COLOR_DARK_GRAY='\033[1;30m'
COLOR_LIGHT_RED='\033[1;31m'
COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_LIGHT_BLUE='\033[1;34m'
COLOR_LIGHT_PURPLE='\033[1;35m'
COLOR_LIGHT_CYAN='\033[1;36m'
COLOR_WHITE='\033[1;37m'

# echo a string in a color
function color_println()
{
  local color=$1
  local message=$2
  if [ "${message}" == "" ] ; then
    echo 'Message is required for color_println'
    exit 1
  fi

  if [ "${color}" == "" ] ; then
    echo 'Color is require for color_println'
    exit 1
  fi
  echo -n -e "${color}"
  echo -n "${message}"
  echo -e "${COLOR_NONE}"
}

# echo a string in a color without a newline
function color_print()
{
  local color=$1
  local message=$2
  if [ "${message}" == "" ] ; then
    echo 'Message is required for color_println'
    exit 1
  fi

  if [ "${color}" == "" ] ; then
    echo 'Color is require for color_println'
    exit 1
  fi
  echo -n -e "${color}"
  echo -n "${message}"
  echo -n -e "${COLOR_NONE}"
}
