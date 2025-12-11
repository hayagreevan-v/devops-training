# Topics
- Taints , Tolerations
- Node Selectors
- What & When to use side cars & init-containers
- What & When to use  Readiness Probe and Liveness probes
- Why should we use labels?
- When to use annotations?
- StorageClasses, PV, PVCs -  EFS, EBS in AWS EKS

# Reference
Please find course material for the same,
 

1. Node Selectors, Taints and Tolerations -  Section 3 - 56 to 69  
2. Init and Sidecars - Section 5 - 122 - 125  
3. Storage - Section 8 -  200 to 213  
4. Annotations - https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
5. Liveness and Readiness Probe -  
        https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/
        https://www.youtube.com/watch?v=fqfieWP1jY4
# Normal Tasks

1. Create a small 2 replica deployment with:
Init containers where the init container fetches a file from anywhere (S3, Gist etc.,) and updates the local volume.
The main pod should able to read the file. At-least try to cat it. 


2. Create a small node in your local K8s clusters and taint the nodes.
Now, try to spin up a deployment with right tolerations so that pod can able to get scheduled on the above node that you created.
	
Hint: Explore on Taints & tolerations

``` bash
minikube node add
😄  Adding node m02 to cluster minikube as [worker]
❗  Cluster was created without any CNI, adding a node to it might cause broken networking.
👍  Starting "minikube-m02" worker node in "minikube" cluster
🚜  Pulling base image v0.0.48 ...
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
🐳  Preparing Kubernetes v1.34.0 on Docker 28.4.0 ...
🔎  Verifying Kubernetes components...
🏄  Successfully added m02 to minikube!

kubectl taint nodes minikube-m02 app=webapp:NoSchedule
node/minikube-m02 tainted

k label nodes minikube-m02 app=webapp
node/minikube-m02 labeled
```

**Without Toleration**
``` sh
  Warning  FailedScheduling  84s   default-scheduler  0/2 nodes are available: 1 node(s) didn't match Pod's node affinity/selector, 1 node(s) had untolerated taint {app: webapp}. no new claims to deallocate, preemption: 0/2 nodes are available: 2 Preemption is not helpful for scheduling.
```


3. Explore on default labels and annotations associated with Kubernetes nodes.
Use topology.kubernetes.io/zone label in the nodeSelectors to schedule a simple nginx pod in "us-east-1c" zone.
Once pod is RUNNING, check it's node details where it got provisioned.
	
Hint: Complete this in our EKS cluster


4. We have deployed EFS and EBS controllers, explore on the current storage classes and how its configured
Try to spin up pods with PVCs using different storageClasses (EFS & EBS)
	
 