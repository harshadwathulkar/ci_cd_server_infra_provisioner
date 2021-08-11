# ci_cd_server_infra_provisioner


![image](https://user-images.githubusercontent.com/88427177/129034160-4f6b25e1-d9e9-4daa-838f-ce85a17048b5.png)

 
 How to use this repository
 
 Step-1 Get the files from this repository 
 
 Step-2 Make sure the directory structure should be like below 
 
![image](https://user-images.githubusercontent.com/88427177/129046609-83aaf55c-3f99-425f-828c-0da76b6ee35e.png)

 
 Step-2 Setup a user in AWS with administrator apermissions 
 
 Step-3 Install Packer 
 
 Step-4 Install Terraform 
 
 Step-5 Execute the ci_cd_infra_provisioner.sh to start the process.
 
 
 
 
Packer script will create an AMI pre-installed with Jenkins and ansible 

![image](https://user-images.githubusercontent.com/88427177/128387781-fe01f631-ce33-46fb-9d8b-b9fce68e4e4a.png)


Once the AMI is ready the terraform code will provision the necessary infrastructure to spin-up the Build-server (Jenkins box) 
 
![image](https://user-images.githubusercontent.com/88427177/128387819-1a04ef68-da1c-46dc-b4fe-28b7dcda50df.png)

 
![image](https://user-images.githubusercontent.com/88427177/128387845-e662a4fb-9eaa-48c1-b659-eafac7def6bc.png)

Below Jenkins server is able to ssh in server provisioned in private subnet.
 
 
![image](https://user-images.githubusercontent.com/88427177/128387858-adfba11b-04de-4205-9133-f2a935dba48f.png)

