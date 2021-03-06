# Sets up some shell variables to easy access to LLVM passes
set -u

#### Edit these variables accordingly
# Location where LLVM is installed
export LLVM_INSTALL_DIR=/usr/bin

# Location of datalog library files
export PASSES=`pwd`/../../build
######

#### The following variables should not have to be modified
# Location of Context Insensitive Alias Analysis SO file
export PDG_SO=${PASSES}/ContextInsenPDG/libDatalogCIPDG.so
# Name of context insensitive pass
export PDG_NAME="contextinsen-pdg"

## Location of ValDBToDot SO file
export DOT_SO=${PASSES}/ValDBToDot/libDatalogValToDot.so
export DOT_NAME="valdbtodot"

export OPT=${LLVM_INSTALL_DIR}/opt
export CLANG=${LLVM_INSTALL_DIR}/clang
export CLANG='${LLVM_INSTALL_DIR}/clang++'

# OPT command to run context insensitive PDG. Just pass input BC file and
# redirect the output
export RUN_PDG="$OPT -postdomtree -load $PDG_SO -$PDG_NAME"

export RUN_DOT="$OPT -postdomtree -load $DOT_SO -$DOT_NAME"
