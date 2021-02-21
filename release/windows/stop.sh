#!/bin/bash
CWD=$(cd "$(dirname $0)";pwd)
"$CWD"/UPAREserver.exe stop
"$CWD"/UPAREserver.exe uninstall 