#!/bin/bash
CWD=$(cd "$(dirname $0)";pwd)
"$CWD"/UPAREserver stop
"$CWD"/UPAREserver uninstall 