## Day 1 - Topics
 
1. Legacy systems overview


2. Why containers?


3. Why VMs?


4. Container Orchestration


5. Kubernetes Introduction


6. What is a K8s Cluster?


7. K8s Architecture Overview - What are control planes, nodes, API Server, Kubelet, etcd, KubeProxy etc.,
 

## Course: 
Section 1 & 2 (Upto 21) & kubernetes docs! - https://kubernetes.io/docs/concepts/overview/

## Tasks : 
Create your local K8s cluster using Minikube/Rancher & explore the components that got installed.
Reference Video: https://www.youtube.com/watch?v=X48VuDVv0do


``` sh
brew install minikube

minikube start
😄  minikube v1.37.0 on Darwin 15.7.2 (arm64)
✨  Automatically selected the docker driver
📌  Using Docker Desktop driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.48 ...
💾  Downloading Kubernetes v1.34.0 preload ...
    > gcr.io/k8s-minikube/kicbase...:  450.06 MiB / 450.06 MiB  100.00% 24.85 M
    > preloaded-images-k8s-v18-v1...:  332.38 MiB / 332.38 MiB  100.00% 14.64 M
🔥  Creating docker container (CPUs=2, Memory=6100MB) ...
🐳  Preparing Kubernetes v1.34.0 on Docker 28.4.0 ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```


## Links :
- https://notes.kodekloud.com/
- https://www.youtube.com/watch?v=E2pP1MOfo3g
- https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fhomebrew
- https://kubernetes.io/docs/tasks/tools/
- https://kubernetes.io/docs/concepts/overview/
- https://www.youtube.com/watch?v=X48VuDVv0do
- https://www.udemy.com/course/certified-kubernetes-administrator-with-practice-tests