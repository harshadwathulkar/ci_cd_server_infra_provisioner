#!/bin/bash

datestr=$1
WORK_DIR=$(pwd)
echo "Validating build file"
echo "$(packer --version)"
cd $WORK_DIR/Provision_Build_Server/
packer validate Build-CICD-Server.json 2>&1  | tee $WORK_DIR/script_Logs/packer_log_$datestr.log

echo "Starting build"
cd $WORK_DIR/Provision_Build_Server/
packer build Build-CICD-Server.json 2>&1  | tee $WORK_DIR/script_Logs/packer_log_$datestr.log


