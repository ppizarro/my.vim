#!/bin/sh

PLUGIN_NAME=$1
PLUGIN_GIT_REPO=$2
PLUGIN_INSTALL_DIR=$3

echo "Installing "$PLUGIN_NAME
rm -rf $PLUGIN_INSTALL_DIR
mkdir -p $PLUGIN_INSTALL_DIR
git clone $PLUGIN_GIT_REPO $PLUGIN_INSTALL_DIR 
