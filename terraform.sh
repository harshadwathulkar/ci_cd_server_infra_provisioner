#!/bin/bash

datestr=$1
WORK_DIR=$(pwd)

echo "Please select the opltions below carefully !!!"
echo "If you are running the Terraform configuration first time you need to select option 1"
echo "If your terraform is already initialized select below option 2"
echo ""
echo "==================================================================="
echo "1. Initialize and apply Terraform Configurations"
read -p "2. Apply terraform configuration:            " OPTION
echo "==================================================================="
echo ""

case $OPTION in 
        1)
        echo "Validating configuration !!"
        echo "$(terraform --version)"
        cd $WORK_DIR/provision_infra/
        terraform validate  
        echo "Initializing with [ terraform init ]"
        cd $WORK_DIR/provision_infra/
        terraform init
        tearrform apply -auto-approve 2>&1  | tee terraform_log_$datestr.log
        echo ""
        ;;
        2)
        cd $WORK_DIR/provision_infra/
        echo "Applying terraform configuration"
        terraform apply -auto-approve 2>&1  | tee terraform_log_$datestr.log
        ;;
esac