# Topics 
 
- Services -- Cluster IP, NodePort, with practical examples. Check how nodeport get assigned for your svc.


- Ingress, Egress in K8s


- Policies , Admission policies , Network policies 


- Load balancer and Ingress resource. How Ingress creates the LBs


- HPA and VPA

# Reference
Please find below course material for the same...
 
  Service and Its types- https://www.youtube.com/watch?v=T4Z7visMM4E&t=43s


  Ingress - Section 9 -> 245 - 251, https://www.youtube.com/watch?v=GhZi4DxaxxE
 
  TLS - Section 6 -> 160 - 162

  Admission Controllers - Section 3 ->  87 to 92
 
  HPA & VPA - Section 5 -> 128 to 136, https://www.youtube.com/watch?v=pI_pMsuazqw
 
  Network Policies - Section 6 ->  191 to 193
# Normal Task

1. Create 2 deployments using http-echo image with "apple" & "orange" as text outputs respectively. 
Each deployments should have 1 replica each.
Create Services for both deployments (at this point, test both the services are working locally by port-forwarding them)
Create Ingress with ALB annotations, and configure 2 path based rules /apple should route to apple backend service, similarly for the/orangeshould route to orange backend service.
	
The default port is 5678, but this is configurable via the-listen flag.
https://github.com/hashicorp/http-echo
 
Explore how the targetGroups are attached for each path based rule in the ALB that got created.


2. Configure the above deployment with HPA:
"Apple" deployment should scale from 1 -> 2 when CPU usage is above 50%
"Orange" deployment should scale from 1 -> 2 when Memory's average usage is 100Mi
	
HPA specs & docs

``` sh
minikube addons enable ingress

kubectl -n ingress-nginx get po
kubectl -n ingress-nginx port-forward deploy/ingress-nginx-controller 8080:80
```

``` sh
minikube addons enable metrics-server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```