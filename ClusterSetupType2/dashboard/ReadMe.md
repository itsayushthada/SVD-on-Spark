# Dashboard Deployment

Grant executable permission to dashboard script.
  
	chmod +x ~/dashboard/dashboard.sh

Create a symbolic link to the dashboard script in **/bin**
  
	sudo ln -s ~/dashboard/dashboard.sh /usr/local/bin/dashboard
  
 Once this gets completed, we can use the following commands:
 |command           | Usecase            |
| ---------------- |:--------------|
| dashboard start        | Start the dashboard and show the tokens |
| dashboard status      | Check whether the dashboard is running or not and output the tokens if currently set |
| dashboard stop      | Stop the dashboard |

## Dashboard Access

TO access the dashboard,
  
	ssh -L localhost:8001:127.0.0.1:8001 <user>@<master_public_IP>
	dashboard start

The dashboard will be accessible from base machine at
	http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
	
### Relauch the Dashboard 
If it gives error kill the kubectl proxy process and restart it.
  
	ps aux | grep kubectl
	kill -p <process-id>
	kubectl proxy

