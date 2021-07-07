# Spark Cluster Deployment Using Kubernetes

## Contents


The contents of the folder are as follow:
| Folder        | Description                                                                                                                         |
| ------------- |:---------------------------------------------------------------------:|
| Dashboard   | It contains the YAML file for the dashboard deployment.                                       |
| Jupyter       | It contains a YAML file for Jupyter+Spark +PV-Claim deployment.                                        |
| PC-Volume | It contains the YAML for persistence volume creation that later used by Jupyter Environment. |
| LocalStack | It contains a YAML file for AWS like S3 service deployment using localstack.                        |

## Node IPs

IP's are made static by setting up the entries in the **/etc/hosts** file.

|Service           | Ip            |
| ---------------- |:--------------|
| K8-Master        | *10.101.83.2* |
| K8-Worker1       | *10.101.83.3* |
| K8-Worker2       | *10.101.83.4* |

For services like Dashboard, JUpyter, Spark Master etc., proxy will be applied. So it will be accessible from **https://localhost:port**. The port number is generated randomly; therefore, I cannot mention it here beforehand.

## Steps

Kubernetes installation is quite straightforward. It is mentioned [here](https://kubernetes.io/docs/tasks/tools/).

The step the cluster follow these steps:
+ Turn off swap on all master and worker nodes.
  
		sudo swapoff -a
		sudo sed -i '/swap/d' /etc/fstab
    

+ Initialize the Kubernetes API server on the master node.

		sudo kubeadm init --apiserver-advertise-address=10.101.83.2 \
		                  --pod-network-cidr=192.168.0.0/16 \
		                  --ignore-preflight-errors=all

+ The previous step will produce command with a token and discovery token CA certificate. Execute this command on all worker nodes.

		sudo kubeadm join 10.101.83.2:6443 --token w0tf9s.o6ezp9ixq2qlozjy \
		--discovery-token-ca-cert-hash sha256:dedf940398221b2e191fd7888a42fb51851a0f6929eb3ab2d8f8c1107ab5c46bp
    
+ Now, come to the master node and execute the following commands.

		sudo mkdir -p $HOME/.kubesudo 
		sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
		sudo  chown $(id -u):$(id -g) $HOME/.kube/config

+ Setup Network plugin for master.

		kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml 

The Kubernetes network model specifies that pods must be able to communicate with each other directly using pod IP addresses. But it does not mandate that pod IP addresses are routable beyond the boundaries of the cluster. Many Kubernetes network implementations use overlay networks. Typically for these deployments, when a pod initiates a connection to an IP address outside of the cluster, the node hosting the pod will SNAT (Source Network Address Translation) map the source address of the packet from the pod IP to the node IP. This enables the connection to be routed across the rest of the network to the destination (because the node IP is routable). Return packets on the connection are automatically mapped back by the node replacing the node IP with the pod IP before forwarding the packet to the pod. When using Calico, depending on your environment, you can generally choose whether you prefer to run an overlay network or prefer to have fully-routable pod IPs. 

At this point, Kubernetes Cluster is setup up. To verify it, we can run the `kubectl get nodes command. It will show the master and worker nodes.
 
Now each component listed can be deployed individually. The steps are written in their respective folders. All the deployment will be done through the master node.
