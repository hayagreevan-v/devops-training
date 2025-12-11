# Topics
 
- Admission Controller
- Helm charts
- Why helm charts
- Kustomize
 
 
# References
 
Admissions Controllers - 
https://kubernetes.io/blog/2019/03/21/a-guide-to-kubernetes-admission-controllers/ 
https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/  
Section 12 - Helm  
Section 13 - Kustomize

# Tasks
1. Explore Kustomize. 
Deploy NGINX container and use Kustomize to update to latest version of the Nginx Image add prefix and suffix for the name.
	
    https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/

``` sh
k apply -k nginx-kustomize/overlays/dev/
```

2. Explore Helm and deploy sample application from the link
	
    https://www.youtube.com/watch?v=kJscDZfHXrQ
    https://devopscube.com/create-helm-chart/


``` sh
helm create nginx-chart
helm install nginx-helm nginx-chart
helm uninstall nginx-helm

```

#### Optional
 
Develop a generic, reusable Helm chart that can deploy any type of application by simply providing a values file. The Helm chart must follow best practices and standards.
 
Tip: Have an example references for your values files for sample application and ReadMe as well.
 
This should be applied across different applications without rewriting manifests. Users should be able to deploy various workloads by only modifying the values. file 
 
Your Helm chart must include templates for the following Kubernetes resources
Deployment
Service
Ingress
ConfigMap
Secrets
Service Account
HorizontalPodAutoscaler (HPA)
Stateful Set
PVC
(Optional Bonus: PodDisruptionBudget, NetworkPolicy, Resource Quota, LimitRange, Job, CronJob etc.)


## Links
https://devopscube.com/create-helm-chart/
https://kubernetesday8.netlify.app/