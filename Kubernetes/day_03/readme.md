## Day 3 - Topics
 
- Commands and Arguments to pod

- When to use command and arguments

- Configmaps 

- Secrets

- When to use a secret as a configmap

- What is the advantage of storing a secret as k8s secret and what is not? 

- Service account and secret token

- Resource Request, Resource quotas and limit ranges

### Learning References

https://www.udemy.com/course/certified-kubernetes-administrator-with-practice-tests/
 
**Commands and Arguments, ConfigMap, Secrets**  
Section 5  -->  107 - 119
 
**Service Account**  
Section 7 --->  181
 
**Resource Requests and Limits** - https://www.youtube.com/watch?v=xjpHggHKm78


## Tasks 


### Normal Tasks:
 



1. Spin up a simple pod with commands & arguments and learn about Pod lifecycle, by adjusting restartPolicy.  
	
    https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/


2. Create a simple secret and use them in a pod as environment variable & explore how to mount as a volume in a pod.
	
 


3. Create a configMap with multiple files and data keys 
    - Mount the files as volume to the pods
	- Set the data keys from ConfigMaps as pod env variables  
Exec into the pods to verify if the volumes are mounted correctly.
	
 


4. Try to spin up a huge pod with 4vCPUs & 4Gi RAM and see why it's not getting scheduled.
	
    https://kubernetes.io/docs/concepts/policy/resource-quotas/
    https://kubernetes.io/docs/concepts/policy/limit-range/
 
- Optional Task
 Deploy a simple custom Nginx deployment which uses a custom image from your private Docker registry and configure the pod to pull the image from private registry without any errors

To store docker creds
``` bash
kubectl create secret docker-registry regcred \
  --docker-server=<your-registry-url> \
  --docker-username=<your-username> \
  --docker-password=<your-password> \
  --docker-email=<your-email>

```

## Debugging Tasks:



1. Debugging-D3-01
	
    Check for the pod named d3-01-app-pod in your namespace. The pod keeps crashing and restarting. Investigate the command and arguments configuration, identify the syntax error, and fix it to make the pod run successfully.
        
    - [Define Command and Arguments](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/)
    - [Container Lifecycle](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/)
    - [Debug Running Pods](https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/)


2. Debugging-D3-02
	
    Check for the deployment d3-02-app-deployment and ConfigMap d3-02-app-config in your namespace. The deployment pods are failing to start due to incorrect ConfigMap key references in environment variables. Find and fix all key mismatches.
        
    - [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/)
    - [Configure Pod ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
    - [Environment Variables](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)


## Links
- https://k8s-day3-guide.netlify.app/
- [Setting Resource Requests and Limits in Kubernetes](https://www.youtube.com/watch?v=xjpHggHKm78)
- https://kubernetes.io/docs/concepts/configuration/configmap/