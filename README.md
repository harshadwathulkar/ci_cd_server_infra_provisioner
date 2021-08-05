# ci_cd_server_infra_provisioner


![image](https://user-images.githubusercontent.com/88427177/128387749-09e61d7e-221f-4b2e-ae63-1d55790c2eaf.png)
 

Packer script will create an AMI pre-installed with Jenkins and ansible 

![image](https://user-images.githubusercontent.com/88427177/128387781-fe01f631-ce33-46fb-9d8b-b9fce68e4e4a.png)


Once the AMI is ready the terraform code will provision the necessary infrastructure to spin-up the Build-server (Jenkins box) 
 
![image](https://user-images.githubusercontent.com/88427177/128387819-1a04ef68-da1c-46dc-b4fe-28b7dcda50df.png)

 
![image](https://user-images.githubusercontent.com/88427177/128387845-e662a4fb-9eaa-48c1-b659-eafac7def6bc.png)

Below Jenkins server is able to ssh in server provisioned in private subnet.
 
 
![image](https://user-images.githubusercontent.com/88427177/128387858-adfba11b-04de-4205-9133-f2a935dba48f.png)

