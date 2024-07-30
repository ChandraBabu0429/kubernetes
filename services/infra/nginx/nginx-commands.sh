# Use the following command to setup nginx ingress controller and change to load balancer
kubectl apply -f nginx-ingress-controller-deployment.yaml
kubectl apply -f nginx-service.yml

kubectl delete pods -l app=nginx -n ingress-nginx

# To clean up the nginx ingress controller and nginx service(Do not une unless you want to clean up the deployment)
kubectl delete -f nginx-ingress.yml
kubectl delete -f nginx-ingress-controller-deployment.yaml
