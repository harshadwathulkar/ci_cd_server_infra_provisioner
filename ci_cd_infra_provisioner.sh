#!/bin/bash
# ./ci_cd_infra_provisioner.sh  2>&1  | tee output.file 
# INIT 
WORK_DIR=$(pwd)
datestr=`date +"%m%d%y_%H%M%S"`

# ------------------------------------------------------
# Starting packer build
startPackerBuild(){
echo "[INFO]--------------------------------"
echo " Starting AMI builder "
echo "--------------------------------------"
echo ""
echo "$WORK_DIR"
sh $WORK_DIR/packer.sh $datestr 2>&1  | tee $WORK_DIR/script_Logs/packer_log_$datestr.log         
}

# ----------------------------------------------------------
#Replacing the old AMI-ID with new AMI-ID
updateNewAmi_ID(){
# Getting previous AMI-ID
previous_AMI_ID=$(cat $WORK_DIR/provision_infra/ec2.tf | grep 'ami = "' | head -n1 | awk -F '"' '{print $2}')
# Getting new AMI-ID 
NEW_AMI_ID=$(grep -A 1 'amazon-ebs: AMIs were created:' $WORK_DIR/script_Logs/packer_log_081121_091239.log | grep 'ami-' | awk -F ":" '{print $2}' | sed 's/^.//')
# Updating new Image name
sed -i "s/$previous_AMI_ID/$NEW_AMI_ID/" $WORK_DIR/provision_infra/ec2.tf
}

# --------------------------------------------------------
# Starting Terraform provisioning 
startTerraformProcessing(){
echo ""
echo "[INFO]--------------------------------"
echo " Init Infra provisioner "
echo "--------------------------------------"
echo ""
updateNewAmi_ID
echo "New AMI-ID Updated in ec2 file !!"

sh $WORK_DIR/terraform.sh $datestr 2>&1  | tee $WORK_DIR/script_Logs/terraform_log_$datestr.log
echo ""
echo "[INFO]======================================================================================"
echo "Infrastructure is ready with Jenkins and ansible installed in Ubuntu server"
echo "http://<public-Ip>:8080/jenkins"
}

# ---------------------------------------------------------
#  Destroy Infrastructure
destroyInfrastructure(){
    cd $WORK_DIR/provision_infra/
    terraform destroy -auto-approve
}

# ---------------------------------------------------------
# Launch methods 
# startPackerBuild
# startTerraformProcessing

echo "########################################################################"
echo "   Please select !!"
echo "1. Start packer build [ AMI with pre-installed Jenkins and Ansible will be created ] "
echo "2. Apply terraform configuration with new AMI-ID build by Packer " 
echo "3. Execute packer build and apply new AMI-ID with Terraform configuration."
read -p "4. Destroy Infrastructure. " OPERATION
echo "########################################################################"

case $OPERATION in 
        1|1.)
        echo "Executing option 1."
        startPackerBuild
        ;;
        2|2.)
        echo "Excuting option 2."
        startTerraformProcessing
        ;;
        3|3.)
        echo "Executing option 3."
        startPackerBuild
        startTerraformProcessing
        ;;
        4|4.)
        echo "Executing option 4."
        destroyInfrastructure

esac 