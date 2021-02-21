#!/bin/bash
CWD=$(cd "$(dirname $0)";pwd)
"$CWD"/UPAREserver.exe install
"$CWD"/UPAREserver.exe start 