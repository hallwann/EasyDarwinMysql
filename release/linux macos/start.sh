#!/bin/bash
CWD=$(cd "$(dirname $0)";pwd)
"$CWD"/UPAREserver install
"$CWD"/UPAREserver start 