# Jupyter Environment


It is always a good step to create a namespace before we do anything.
  
	kubectl create ns <namespace-name>
    
Copy the YAML file in the master node and run the following command.
  
	kubectl apply -f jupyter.yaml -n <namespace-name>

We can check the if PV is created or not with following commands:
  
	kubectl get pods -A
 	kubectl get pods -n <namespace-name>
    
 The first command can be used if we want to check pods irrespective of the namespace.
 
 To get the port number on which the jupter can be accessed on base machine, run this command
   
	kubectl get service -n <namespace-name>
It will return a name  of pods along with the port mapping in format **R: L>** here **R** is the port inside docker and **L** is 
port on which docker's internatl port is mapped.

The service will be accessible at master's IP.
