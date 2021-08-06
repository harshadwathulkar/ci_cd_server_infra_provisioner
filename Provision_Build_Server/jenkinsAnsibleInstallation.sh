sudo apt-get update -y
sudo mkdir /liveBuildServer
cd /liveBuildServer
echo ""
echo ""
echo "[INFO]==========================="
echo "Downloading Apache tomcat package from official website"
sudo wget https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz
sudo tar -zxvf apache-tomcat-9.0.50.tar.gz
sudo rm -rf apache-tomcat-9.0.50.tar.gz
sudo chown -R ubuntu:ubuntu apache-tomcat-9.0.50
sudo chmod -R 755 apache-tomcat-9.0.50/
sudo rm -rf /liveBuildServer/apache-tomcat-9.0.50/webapps/*
cd /liveBuildServer/apache-tomcat-9.0.50/webapps/
sudo wget https://get.jenkins.io/war/2.305/jenkins.war
echo ""
echo "[INFO]==========================="
echo "Downloading jenkins war from official website "
echo ""
echo "[INFO]==========================="
echo "installing jdk"
sudo apt update

java -version
sudo apt install default-jre -y
sudo apt install default-jdk -y

java --version
echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "Jenkins Installation completed"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
echo "[INFO]==========================="
echo "installing Ansible "
sudo apt-get update
sudo apt install software-properties-common -y
sudo apt update
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update
sudo apt install ansible -y
sudo apt install net-tools -y
echo "------------"
ansible --version
echo "------------"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "Ansible Installation completed"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

echo ""
echo "Please use below command to start the jenkins server"
echo "sudo /liveBuildServer/apache-tomcat-9.0.50/bin/startup.sh"

#packer build -var aws_access_key=************* -var aws_secret_key=*********** k8s_aws_ami_builder.json