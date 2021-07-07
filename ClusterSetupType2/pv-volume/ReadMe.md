# Persistent Volume Setup

It is always a good step to create a namespace before we do anything.
  
	kubectl create ns <namespace-name>
    
Copy the YAML file in the master node and run the following command.
  
	kubectl apply -f pv-volume.yaml -n <namespace-name>

We can check the if PV is created or not with following commands:
  
	kubectl get pv -A
 	kubectl get pv -n <namespace-name>
    
 The first command can be used if we want to check persistent volume irrespective of the namespace.
