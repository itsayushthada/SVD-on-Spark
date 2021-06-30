# Multinode Docker Based Spark Cluster

## Contents


The contents of the folder are as follow:
| Folder        | Description                                                                                                                         |
| ------------- |:-----------------------------------------------------------------------------------------------------------------------------------:|
| DockerFiles   | This folder contains all the docker files which are required to build each component of the cluster like cluster base, spark base, master node, worker node and the jupyter lab environment.                                                                            |
| Scripts       | It contains the script for building docker images from the docker file and exposing the web UI of the service to public IPs for quick testing.                                                                                                                      |
| ClusterRecipe | It contains the compose, which act as a tool for defining and running multi-container Docker applications.                          |

## Steps

The step to building the cluster is as follows:
+ The first step is to copy the content of every folder in the same place or modify the scripts accordingly.
  
		cp DockerFiles/* ./ && Scripts ./ && ClusterRecipe ./
    

+ Build all the images using the **build.sh** script.

		sudo chmod +x build.sh
		./build.sh

+ Launch the docker using the generated images using cluster recipe.

		docker-compose up
    
+ Once all the services get started and the ports are displayed on the screen following script can be used to get public IP for each available UI

		sudo chmod +x public_expose.sh
 		s./public_expose.sh
    
 + Once the public IPs are generated, services like JupyterLab and the UI server of master and worker nodes can be accessed through it.

## Additional Resource
The main reason to prove the docker file is that if the user wants to add any functionality, it can add to the docker files. But if you want some generic settings, you can use prebuilt images rather than building images from scratch. The images can be pulled from the docker hub instead of building from scratch.

|Image Name        | Pull Command                                       |
| ---------------- |:---------------------------------------------------|
| cluster-base |  *docker pull itsayushthada/cluster-base:v1* |
| spark-base | *docker pull itsayushthada/spark-base:v1* |
| spark-master | *docker pull itsayushthada/spark-master:v1* |
| spark-worker | *docker pull itsayushthada/spark-worker:v1* |
| jupyter-lab | *docker pull itsayushthada/jupyter-lab:v1* |
| localstack | *docker pull localstack/localstack:0.12.1* |
