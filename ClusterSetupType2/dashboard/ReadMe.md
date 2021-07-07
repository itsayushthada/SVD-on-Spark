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
