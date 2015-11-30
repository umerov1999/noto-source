# Copyright 2015 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

setup() {
    if [[ ! $(python -m pip) ]]; then
        if [[ ! $(sudo python -m ensurepip) ]]; then
            echo "You need to manually install pip."
            exit 1
        fi
    fi
    sudo python -m pip install --upgrade -r requirements.txt
}

build_all() {
    for source in src/*.glyphs src/*/*.glyphs; do
        build_one "${source}"
    done
}

build_one() {
    echo "==== building $1"
    python -m fontmake "$1"
    echo
}

main() {
    case "$1" in
        setup) setup ;;
        build_one) build_one $2 ;;
        *) build_all ;;
    esac
}

main "$@"
