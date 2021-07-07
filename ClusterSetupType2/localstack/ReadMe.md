# LocaStack Deployment

It is always a good step to create a namespace before we do anything.
  
	kubectl create ns <namespace-name>
    
Copy the YAML file in the master node and run the following command.
  
	kubectl apply -f localstack.yaml -n <namespace-name>

We can check the if PV is created or not with following commands:
  
	kubectl get pods -A
 	kubectl get pods -n <namespace-name>
    
 The first command can be used if we want to check pods irrespective of the namespace.
