# gcp-3tier-app
3 tier web application using gcp services
![gcp-3tier-app](https://user-images.githubusercontent.com/94898079/214829071-6980fc1b-ef7e-487b-82a0-2fc97415c8f5.png)


Steps to follow for deploying the application

step-1.creating of instance group

	1.create a instance template 

	gcloud compute instance-templates create gcp-ig-template --project=play-ground --machine-type=e2-medium --network-interface=network=default,network-tier=PREMIUM --maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=512447805963-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=https-server --create-disk=auto-delete=yes,boot=yes,device-name=gcp-ig-template,image=projects/debian-cloud/global/images/debian-11-bullseye-v20221206,mode=rw,size=10,type=pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any

	2.	gcloud compute instance-groups managed create gcp-3-tier-app-ig --project=play-ground --base-instance-name=gcp-3-tier-app-ig --size=1 --template=asia-south1-template --zone=asia-south1-c --list-managed-instances-results=PAGELESS --health-check=gcp-3-tier-hc—initial-delay=300 --no-force-update-on-repair

	gcloud beta compute instance-groups managed set-autoscaling gcp-3-tier-app-ig --project=play-ground --zone=asia-south1-c --cool-down-period=60 --max-num-replicas=3 --min-num-replicas=1 --mode=on --target-cpu-utilization=0.6

step-2 nat configuration

->as our instance group is not publicly accessible so need to create a create a cloud nat with a cloud router 

step-3 create a Loadbalncer
	create a global HTTP(S) Loadbalancer with all necessary configuration of frontend config and backend config.


step-4 create a cloud sql instance and integrate with

create a cloud SQL instance with MySQL give all necessary version and MySQL configuration choose the private ip give the application ip as authorised network
and create the instance.

add a user with host name

step-5 setup firewall rule
create a firewall in the vac network to allow request for cloud SQL in the port 3306 ,choose specified target tags and create the firewall

step-6 deploy the application and test

ssh to a vm and do git clone https://github.com/Shreedhar-keshav/gcp-3tier-app.git

sudo apt update -y

sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y

pip install flask -y

pip install wheel -y 

pip install gunicorn flask -y 

sudo apt-get install python3-mysqldb -y

python3 flaskapp.py(to start the application)
